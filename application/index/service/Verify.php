<?php

namespace app\index\service;

use app\common\model\Order;
use think\facade\Hook;

/**
 * Class Auth
 *
 * @package \app\index\service
 */
class Verify extends BaseService
{
    /**
     * 签约短信发送
     * @param \app\common\model\Order $order
     */
    public function bankSend(Order $order)
    {
        $result = Hook::listen('bankcard_send', [], true);

        if ($result !== false) {
            $this->result($result);
        }

        $this->error('服务器异常');
    }

    /**
     * 银行卡验证签约
     */
    public function bankcard(Order $order)
    {
        //银行卡签约
        $result = Hook::listen('bankcard', [], true);

        $code = $result['code'] ?? 0;
        if (empty($code)) {
            $this->error($result['msg'] ?? '');
        }

        if ($order) {
            /*
             * 银行卡验证通过
             */
            $order->is_bank = 1;
            $order->save();
        }

        $this->success('签约成功', url('verify', ['id'=>$order['id'] ?? 0]));
    }

    /**
     * 合同验证
     */
    public function contract(Order $order)
    {
        //合同签署
        $result = Hook::listen('contract', [], true);
        if ($result !== true) {
            $this->error($result);
        }

        /**
         * 合同验证通过
         */
        $order->is_sign = 1;
        $order->save();

        $this->success('合同签署成功', url('verify', ['id'=>$order['id'] ?? 0]));
    }
}