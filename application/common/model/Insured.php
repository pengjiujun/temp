<?php

namespace app\common\model;

/**
 * 被保人
 * Class Insured
 *
 * @package \app\common\model
 */
class Insured extends Base
{

    const TYPE_PERSONAL = 1;
    const TYPE_ENTERPRISE = 2;

    const INSURED_TYPE = [
        self::TYPE_PERSONAL => '普通用户',
        self::TYPE_ENTERPRISE => '企业用户',
    ];

    /**
     * 订单
     * @return \think\model\relation\HasMany
     */
    public function orders()
    {
        return $this->hasMany('Order');
    }

}