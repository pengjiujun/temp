<?php

class PhpTools
{
    //测试
//    const certFile = __DIR__.'/../data/allinpay-pds.pem';//通联公钥证书
//    const privateKeyFile = __DIR__.'/../data/20060400000605104.pem';//商户私钥证书
    //生产
    const certFile = __DIR__.'/../data/tlt-20131019.pem';//通联公钥证书
    const privateKeyFile = __DIR__.'/../data/20010000002370804.pem';//商户私钥证书
    protected $password = '';//商户私钥密码以及用户密码
//  const  apiUrl = 'http://172.16.1.11:8080/aipg/ProcessServlet';//通联系统对接请求地址（内网）
    public $arrayXml ;
//    const apiUrl = 'http://113.108.182.3:8083/aipg/ProcessServlet';//通联系统对接请求地址（外网,商户测试时使用）
    const apiUrl = 'https://tlt.allinpay.com/aipg/ProcessServlet';//（生产环境地址，上线时打开该注释）

    public function __construct($password = '111111')
    {
        require_once __DIR__.'/ArrayXml.class.php';
        require_once __DIR__.'/cURL.class.php';
        $this->arrayXml = new ArrayAndXml();
        $this->password = $password;
    }
    
    /**
     * PHP版本低于 5.4.1 的在通联返回的是 GBK编码环境使用
     * 但是本地文件编码是 UTF-8
     *
     * @param string $hexstr
     * @return binary string
     */
    public function hextobin($hexstr)
    {
        $n = strlen($hexstr);
        $sbin = "";
        $i = 0;
    
        while ($i < $n) {
            $a = substr($hexstr, $i, 2);
            $c = pack("H*", $a);
            if ($i==0) {
                $sbin = $c;
            } else {
                $sbin .= $c;
            }
    
            $i+=2;
        }
    
        return $sbin;
    }
    
    /**
     * 验签
     */
    public function verifyXml($xmlResponse)
    {
            
        // 本地反馈结果验证签名开始
        $signature = '';
        if (preg_match('/<SIGNED_MSG>(.*)<\/SIGNED_MSG>/i', $xmlResponse, $matches)) {
            $signature = $matches[1];
        }
        $xmlResponseSrc = preg_replace('/<SIGNED_MSG>.*<\/SIGNED_MSG>/i', '', $xmlResponse);
//      $xmlResponseSrc1 = mb_convert_encoding(str_replace('<','&lt;',$xmlResponseSrc), "UTF-8", "GBK");
//        $xmlResponseSrc1 = mb_convert_encoding($xmlResponseSrc, "UTF-8", "GBK");
//        print_r('验签原文');
//        echo $xmlResponseSrc1;
//        dump($xmlResponseSrc);
//        echo $xmlResponseSrc;

        $pubKeyId = openssl_get_publickey(file_get_contents(PhpTools::certFile));
        $flag = (bool) openssl_verify($xmlResponseSrc, hex2bin($signature), $pubKeyId);
        openssl_free_key($pubKeyId);
        //echo '<br/>'+$flag;
        if ($flag) {
//          echo '<br/>Verified: <font color=green>Passed</font>.';
           
        
            // 变成数组，做自己相关业务逻辑
            $xmlResponse = mb_convert_encoding(str_replace('<?xml version="1.0" encoding="GBK"?>', '<?xml version="1.0" encoding="UTF-8"?>', $xmlResponseSrc), 'UTF-8', 'GBK');

            $results = $this->arrayXml->parseString($xmlResponse, true);
//          echo "<br/><br/><font color=blue>-------------华丽丽的分割线--------------------</font><br/><br/>";
//          echo $results;
            return $results;
        } else {
//          echo '<br/>Verified: <font color=red>Failed</font>.';
            return false;
        }
    }
    
    /**
     * 验签
     */
    public function verifyStr($orgStr, $signature)
    {
//        $orgStr1 = mb_convert_encoding($orgStr, "UTF-8", "GBK");
//        echo '签名原文:'.$orgStr1;
        $pubKeyId = openssl_get_publickey(file_get_contents(PhpTools::certFile));
        $flag = (bool) openssl_verify($orgStr, hex2bin($signature), $pubKeyId);
        openssl_free_key($pubKeyId);
        
        if ($flag) {
            echo '<br/>Verified: <font color=red>SUCC</font>.';
            return true;
        } else {
            echo '<br/>Verified: <font color=red>Failed</font>.';
            return false;
        }
    }
    
    /**
     * 签名
     */
    public function signXml($params)
    {
         
        $xmlSignSrc = $this->arrayXml->toXmlGBK($params, 'AIPG');
//        $xmlSignSrc=str_replace("FASTTRX_DETAIL2", "FASTTRX_DETAIL", $xmlSignSrc);
        $xmlSignSrc=preg_replace("#FASTTRX_DETAIL\d+#", "FASTTRX_DETAIL", $xmlSignSrc);
//        $xmlSignSrc1 = mb_convert_encoding($xmlSignSrc, "UTF-8", "GBK");
//      echo ($xmlSignSrc1);
        $privateKey = file_get_contents(PhpTools::privateKeyFile);
        
        $pKeyId = openssl_pkey_get_private($privateKey, $this->password);
        openssl_sign($xmlSignSrc, $signature, $pKeyId);
        openssl_free_key($pKeyId);
        
        $params['INFO']['SIGNED_MSG'] = bin2hex($signature);

        $xmlSignPost = $this->arrayXml->toXmlGBK($params, 'AIPG');

        $xmlSignPost = preg_replace("#FASTTRX_DETAIL\d+#", "FASTTRX_DETAIL", $xmlSignPost);

//        $xmlSignSrc1 = mb_convert_encoding($xmlSignPost, "UTF-8", "GBK");
//        echo ($xmlSignSrc1);

        return  $xmlSignPost;
    }
    /**
     * 发送请求
     */
    public function send($params)
    {
        $xmlSignPost=$this->signXml($params);

//        $xmlSignPost=str_replace("FASTTRX_DETAIL2", "FASTTRX_DETAIL", $xmlSignPost);
        $response = cURL::factory()->post(PhpTools::apiUrl, $xmlSignPost);
    
        if (! isset($response['body'])) {
            die('Error: HTTPS REQUEST Bad.');
        }
        //获取返回报文
        $xmlResponse = $response['body'];
//        print_r($response);
//        print_r("返回报文如下：");
//      print_r(str_replace('<','&lt;',$xmlResponse));
         //验证返回报文
        $result=$this->verifyXml($xmlResponse);
        return $result;
    }
}
