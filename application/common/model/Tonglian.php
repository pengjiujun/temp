<?php

namespace app\common\model;

/**
 * 通联记录
 * Class Pay
 *
 * @package \app\common\model
 */
class Tonglian extends Base
{
    protected $json = ['info'];

    protected $jsonAssoc = true;
    /*const APPLY = 1;
    const SUCCESS = 2;
    const FAIL = 3;
    const STATUS = [
        self::APPLY => '支付中',
        self::SUCCESS => '支付成功',
        self::FAIL => '支付失败'
    ];*/

    const BIND = 1;
    const UNBIND = 2;
    const SEND_BIND = 3;
    const PAY_BIND = 4;
    const PAYS_BIND = 5;
    const REFUND_BIND = 6;
    const SEARCH = 7;
    const TYPE = [
        self::BIND => '银行卡签约',
        self::UNBIND => '银行卡解约',
        self::SEND_BIND => '发送银行卡签约短信',
        self::PAY_BIND => '银行卡协议支付',
        self::PAYS_BIND => '银行卡协议批量支付',
        self::REFUND_BIND => '协议退款',
        self::SEARCH => '交易结果查询'
    ];

}