<?php

namespace app\common\event;

/**
 * 保单观察者
 * Class User
 *
 * @package \app\common\event
 */
class Order
{
    /**
     * 更新后
     * @param \app\common\model\Order $order
     */
    public function afterUpdate($order)
    {
        //保单未完成
        if (intval($order->status) !== $order::STATUS_ACTIVE) {
            //合同
            $is_sign = $order['is_sign'] ?? 0;
            //银行
            $is_bank = $order['is_bank'] ?? 0;

            if (intval($is_bank) === 1 && intval($is_sign)) {
                $order->status = $order::STATUS_ACTIVE;
                $order->save();
                //完成后逻辑
                \app\common\logic\Order::finish($order);
            }
        }
    }
}