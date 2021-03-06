<?php

namespace app\common\model;

/**
 * 还款账单模型
 * Class Bill
 *
 * @package \app\common\model
 */
class Bill extends Base
{
    protected $dateFormat = 'Y-m-d';

    protected $type = [
        'real_time' => 'timestamp',
        'repay_time' => 'timestamp'
    ];
    /*
     * 状态
     */
    const NO = 1;
    const YES = 2;
    const OVERDUE = 3;
    const STATUS = [
        self::NO => '未还',
        self::YES => '已还',
        self::OVERDUE => '逾期'
    ];

    protected $append = [
        'status_txt'
    ];

    protected static function init()
    {
        parent::init(); // TODO: Change the autogenerated stub
        self::afterUpdate(function ($info) {

        });
    }

    /**
     * 绑定用户
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('User', 'uid');
    }

    /**
     * 绑定订单
     * @return \think\model\relation\BelongsTo
     */
    public function orders()
    {
        return $this->belongsTo('Order', 'order_id');
    }

    /**
     * 状态文本
     * @param $value
     * @param $data
     *
     * @return string
     */
    public function getStatusTxtAttr($value, $data)
    {
        return self::STATUS[$data['status']] ?? '';
    }
}