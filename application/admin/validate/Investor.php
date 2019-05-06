<?php
/**
 * Created by PhpStorm.
 * User: jack
 * Date: 2019/1/30
 * Time: 10:20 AM
 */

namespace app\admin\validate;


class Investor extends Base
{

    protected $rule = [
        'investors|资方信息' => 'require|unique:investor'
    ];

}