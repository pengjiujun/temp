<?php

namespace app\index\validate;


/**
 * Class Login
 *
 * @package \app\api\validate
 */
class Order extends Base
{
    protected $rule = [
        'account_no|银行卡号' => 'require',
        'account_name|姓名' => 'require',
        'account_type|银行卡类型' => 'require',
        'bank_code|银行' => 'require',
        'id_type|证件类型' => 'require',
        'idcard|证件号' => 'require',
        'tel|银行预留手机号' => 'require|mobile',
        'cvv2' => 'require',
        'validdate|有效期' => 'require',
        'vercode|验证码' => 'require',
        'srcreqsn|签约协议号' => 'require'
    ];

    protected $scene = [
        'banksend' => [
            'account_no',
            'account_name',
            'account_type',
            'bank_code',
            'id_type',
            'idcard',
            'tel',
        ],
        'bankcardverify' => ['vercode','srcreqsn']
    ];

}