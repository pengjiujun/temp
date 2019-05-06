<?php

namespace app\common\logic;

use app\common\model\Bill;
use app\common\model\Product;
use Carbon\Carbon;

/**
 * 保单
 * Class Order
 *
 * @package \app\common\logic
 */
class Order
{
    /**
     * 保单完成
     *
     * @param \app\common\model\Order $order
     */
    public static function finish(\app\common\model\Order $order)
    {
        $result = self::calc($order);

        //写入还款记录
        Bill::insertAll($result);
    }

    /**
     * 计算分期还款金额
     */
    protected static function calc($order)
    {
        //保单期数
        $stage = $order->stage;
        //还款方式
        $type = $order->repayment;
        //还款金额
        $total = $order->premium;
        //服务费
        $service = $order->service;

        $result = [];

        switch ($type) {
            //趸交
            case \app\common\model\Product::ALL:
                $price = round($total / $stage, 2);

                //设置还款时间
                $carbon = Carbon::createFromTimestamp(strtotime(date('Y-m-d')));

                for ($i = 1; $i <= $stage; $i++) {
                    $arr = [
                        'order_id' => $order->id,
                        'uid' => app()->session->get('user')['id'] ?? 0, //todo 用户id
                        'price' => $price,
                        'repay_time' => $carbon->addMonths($i - 1)->timestamp,
                        'stage' => $i,
                        'create_time' => time(),
                        'update_time' => time()
                    ];
                    //第一期加上服务费
                    if ($i === 1) {
                        $arr['price'] += $service;
                    }
                    array_push($result, $arr);

                }
                break;
            //分期
            case Product::STAGE:
                $price = round(($total + $service) / $stage, 2);

                //设置还款时间
                $carbon = Carbon::createFromTimestamp(strtotime(date('Y-m-d')));

                for ($i = 1; $i <= $stage; $i++) {
                    array_push($result, [
                        'order_id' => $order->id,
                        'uid' => app()->session->get('user')['id'] ?? 0, //todo 用户id
                        'price' => $price,
                        'repay_time' => $carbon->addMonths($i-1)->timestamp,
                        'stage' => $i,
                        'create_time' => time(),
                        'update_time' => time()
                    ]);
                }
                break;
        }

        return $result;
    }
}