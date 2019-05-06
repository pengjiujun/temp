<?php

namespace app\common\model;

/**
 * 支付失败
 * Class Pay
 *
 * @package \app\common\model
 */
class PayFail extends Base
{
    const ONE = 1;
    const TWO = 2;
    const THREE = 3;
    const STATUS = [
        self::ONE => '第一次(01:00)扣款失败',
        self::TWO => '第二次(13:00)扣款失败',
        self::THREE => '第三次(23:00)扣款失败'
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
     * 应还款时间
     * @param $value
     *
     * @return false|string
     */
    public function getRepayTimeAttr($value)
    {
        return is_numeric($value) ? date('Y-m-d', $value) : '';
    }

    public function setRepayTimeAttr($value)
    {
        return is_numeric($value) ? $value : strtotime($value);
    }

}