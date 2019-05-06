<?php

namespace app\common\model;

/**
 * 产品模型
 * Class Product
 *
 * @package \app\common\model
 */
class Product extends Base
{
    /*
     * 支付方式
     */
    const ALL = 1;
    const STAGE = 2;
    const THREE = 3;
    const FOUR = 4;
    const CHARGE = [
        self::ALL => '等额本金',
        self::STAGE => '等额等息',
        self::THREE => '依次收息',
        self::FOUR => '等本等息',
    ];

    protected $append = [
        'charge_txt'
    ];

    public static function getCharge()
    {
        return self::CHARGE;
    }

    /**
     * 返回支付方式
     * @param $value
     * @param $data
     *
     * @return mixed
     */
    public function getChargeTxtAttr($value, $data)
    {
        return self::CHARGE[$data['charge']] ?? '';
    }

}