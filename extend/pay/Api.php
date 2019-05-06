<?php

namespace Pay;

/**
 * 支付接口
 * Class Api
 *
 * @package \Extend\Pay
 */
class Api
{
    //商户id
    protected $merchant_id = '200604000006051';
    //用户名称
    protected $username = '20060400000605104';
    //用户密码
    protected $password = '111111';
    /**
     * @var \PhpTools
     */
    protected $tools = null;

    /**
     * 参数
     * @var array
     */
    protected $param = [];

    public function __construct($param = [])
    {
        require_once __DIR__.'/libs/PhpTools.class.php';

        $this->merchant_id = config('tonglian.merchant_id');
        $this->username = config('tonglian.username');
        $this->password = config('tonglian.password');

        $this->tools = new \PhpTools($this->password);
        $this->param = $param;
    }

    /**
     * 设置参数
     * @param array $param
     *
     * @return $this
     */
    public function setParam(array $param)
    {
        $this->param = $param;

        return $this;
    }

    /**
     * 返回商户号
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * 单笔实时支付
     */
    public function pay()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '100011',
                'VERSION' => '03',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
                'REQ_SN' => '20060400000605104-rrrr1356732144xxxx',
            ),
            'TRANS' => array(
                'BUSINESS_CODE' => '10600',
                'MERCHANT_ID' => $this->merchant_id,
                'SUBMIT_TIME' => '20131218230712',
                'E_USER_CODE' => '10101328',
                'BANK_CODE' => '0105',
                'ACCOUNT_TYPE' => '00',
                'ACCOUNT_NO' => '6203024934580934',
                'ACCOUNT_NAME' => '东东',
                'ACCOUNT_PROP' => '0',
                'AMOUNT' => '100000',
                'CURRENCY' => 'CNY',
                'ID_TYPE' => '0',
                'CUST_USERID' => '2901347',
                'SUMMARY' => '保分期',
                'REMARK' => '30238924-1984857237-237843',
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 签约支付
     */
    public function signPay()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '310011',
                'VERSION' => '04',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
            ),
            'FASTTRX' => array(
                'BUSINESS_CODE' => '10605',
                'MERCHANT_ID' => $this->merchant_id,
                'SUBMIT_TIME' => date('YmdHis'),
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 签约批量支付
     */
    public function signPays()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '310016',
//                'VERSION' => '04',
                'VERSION' => '05',
                'DATA_TYPE' => '2',
                'LEVEL' => '5',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,

            ),
            'BODY' => array(
                'TRANS_SUM' => array(
                    'BUSINESS_CODE' => '19900',
                    'MERCHANT_ID' => $this->merchant_id,
                    'SUBMIT_TIME' => date('YmdHis'),
//                    'TOTAL_ITEM' => '2',    //总记录数
//                    'TOTAL_SUM' => '2000', //总金额
                ),
                'TRANS_DETAILS'=> array(
//                    'FASTTRX_DETAIL'=> array(
//                        'SN' => '00001',
////                        'ACCOUNT_NO'=> '6225883746567298',
//                        'ACCOUNT_NAME'=> '张三',
//                        'AMOUNT'=> '1000',
//                    ),
//                    'TRANS_DETAIL2'=> array(
//                        'SN' => '00002',
//                        'ACCOUNT_NO'=> '6225883746567299',
//                        'ACCOUNT_NAME'=> '张四',
//                        'AMOUNT'=> '1000',
//                    )
                )
            ),

        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 发送签约手机验证码
     */
    public function sendBind()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '310001',
                'VERSION' => '04',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
            ),
            'FAGRA' => array(
                'MERCHANT_ID' => $this->merchant_id,
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 签约银行卡
     */
    public function bind()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '310002',
                'VERSION' => '04',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
            ),
            'FAGRC' => array(
                'MERCHANT_ID' => $this->merchant_id,
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 解约银行卡
     */
    public function unbind()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '310003',
                'VERSION' => '04',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
            ),
            'FAGRCNL' => array(
                'MERCHANT_ID' => $this->merchant_id,
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 交易结果查询
     */
    public function search()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => '200004',
                'VERSION' => '04',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
            ),
            'QTRANSREQ' => array(
                'MERCHANT_ID' => $this->merchant_id
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 协议退款
     */
    public function refund()
    {
        $origin = array(
            'INFO' => array(
                'TRX_CODE' => 'REFUND',
                'VERSION' => '04',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'MERCHANT_ID' => $this->merchant_id,
                'USER_NAME' => $this->username,
                'USER_PASS' => $this->password,
            ),
            'REFUND' => array(
                'BUSINESS_CODE' => '00600',
                'MERCHANT_ID' => $this->merchant_id
            ),
        );

        $param = $this->parse($origin);

        $result = $this->tools->send($param);

        return $this->format($result);
    }

    /**
     * 解析数据
     * @param $origin array 原始格式
     *
     * @return array
     */
    public function parse($origin)
    {
        return array_merge_recursive($origin, $this->param);
    }

    /**
     * 格式化返回数据
     */
    protected function format($data)
    {
        return $data;
    }
}