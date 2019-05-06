<?php

namespace app\common\behavior;

/**
 * 支付事件
 * Class Pay
 *
 * @package \app\common\behavior
 */
class Pay
{
    /**
     * 支付事件
     */
    public function pay($param)
    {
        return true;
    }

    /**
     * 支付回调事件
     * @param $param
     *
     * @return bool
     */
    public function payCallback($param)
    {
        return true;
    }

}
