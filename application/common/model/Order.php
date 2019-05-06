<?php

namespace app\common\model;

/**
 * 订单
 * Class Order
 *
 * @package \app\common\model
 */
class Order extends Base
{
    protected $observerClass = \app\common\event\Order::class;

    const STATUS_APPLY = 1;
    const STATUS_PASS = 2;
    const STATUS_REJECT = 3;
//    const STATUS_PENDING = 4;
    const STATUS_ACTIVE = 5;

    public static $status = [
        self::STATUS_APPLY => '待审核',
        self::STATUS_PASS => '已通过',
        self::STATUS_REJECT => '未通过',
//        self::STATUS_PENDING => '待认证',
        self::STATUS_ACTIVE => '保单生效',
    ];

    const TYPE_INSURANCE = 1;
    const TYPE_POLICY = 2;

    const RENEWAL_TRUE = 1;
    const RENEWAL_FALSE = 0;

    protected $append = [
        'status_txt'
    ];

    //客户关联
    public function insured()
    {
        return $this->belongsTo('Insured', 'insured_id', 'id');
    }

    //产品关联
    public function product()
    {
        return $this->belongsTo('Product', 'product_id', 'id');
    }

    //投保车辆关联
    public function car()
    {
        return $this->hasOne('OrderCar', 'order_id');
    }

    //订单扩展关联
    public function ext()
    {
        return $this->hasOne('OrderExtra', 'order_id');
    }

    /**
     * 状态文本
     * @param $value
     * @param $data
     *
     * @return mixed|string
     */
    public function getStatusTxtAttr($value, $data)
    {
        return self::$status[$data['status']] ?? '';
    }

}