<?php

namespace app\index\validate;

/**
 * Class Login
 *
 * @package \app\api\validate
 */
class Login extends Base
{
    protected $rule = [
        'mobile|手机号' => 'require|mobile|unique:user',
        'password|密码' => 'require|max:25',
        'password_confirm|确认密码' => 'require|confirm',
        'username|用户名' => 'require|max:25|unique:user',
        'code|验证码' => 'require|checkSms'
    ];

    protected $scene = [
        'check' => ['password'],
        'checkregister' => [],
        'checkcaptchalogin' => ['code'],
        'sendsms' => ['mobile'],
    ];

    protected $message = [
        'code.checkSms' => '验证码错误'
    ];
}