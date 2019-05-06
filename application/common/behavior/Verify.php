<?php

namespace app\common\behavior;

use app\common\service\PayService;

/**
 * 验证事件
 * Class Pay
 *
 * @package \app\common\behavior
 */
class Verify
{
    /**
     * 银行卡验证短信发送
     * @param $param
     *
     * @return array 协议号
     */
    public function bankcardSend($param)
    {
        /**
         * @var PayService $pay
         */
        $pay = app()->pay;

        $result = $pay->sendBind();

        return $result;
    }

    /**
     * 银行卡验证
     * @param $param
     *
     * @return array
     */
    public function bankcard($param)
    {
        /**
         * @var PayService $pay
         */
        $pay = app()->pay;

        $result = $pay->bind();

        return $result;
    }

    /**
     * 合同签署
     * @param $param
     *
     * @return bool
     */
    public function contract($param)
    {
        return true;
    }

}
