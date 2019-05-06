<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\23 0023
 * Time: 13:48
 */

namespace app\common\service;

use baidu\AipOcr;

class BaiduApiService
{

    protected $appId;
    protected $apiKey;
    protected $secretKey;
    protected $_client;

    public function __construct()
    {
        $this->appId = config('baidu.app_id');
        $this->apiKey = config('baidu.api_key');
        $this->secretKey = config('baidu.secret_key');
    }

    //调用文字识别api
    public function getAipOcrInstance()
    {
        $this->_client = new AipOcr($this->appId,$this->apiKey,$this->secretKey);
        return $this;
    }

    use AipOcrTrait;

}