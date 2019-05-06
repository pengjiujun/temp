<?php

namespace app\index\service;

use think\facade\Hook;

/**
 * Class Auth
 *
 * @package \app\index\service
 */
class PayService extends BaseService
{
    /**
     * 支付
     */
    public function pay()
    {
        //银行卡签约
        $result = Hook::listen('pay', [], true);
        if ($result !== true) {
            $this->error($result);
        }

        $this->success('支付成功');
    }

    /**
     * 支付回调
     */
    public function payCallback()
    {
        //支付回调
        $result = Hook::listen('pay_callback', [], true);
        if ($result !== true) {
            $this->error($result);
        }

        return true;
    }

}