<?php

namespace app\common\model;

/**
 * 支付
 * Class Pay
 *
 * @package \app\common\model
 */
class Pay extends Base
{
    const APPLY = 1;
    const SUCCESS = 2;
    const FAIL = 3;
    const STATUS = [
        self::APPLY => '支付中',
        self::SUCCESS => '支付成功',
        self::FAIL => '支付失败'
    ];

    const BANK = 1;
    const TYPE = [
        self::BANK => '银行'
    ];

    /**
     * 绑定用户
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('User', 'uid');
    }

    /**
     * 绑定账单
     * @return \think\model\relation\BelongsTo
     */
    public function bill()
    {
        return $this->belongsTo('Bill', 'bill_id');
    }
}