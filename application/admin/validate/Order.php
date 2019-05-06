<?php
/**
 * Created by PhpStorm.
 * User: jack
 * Date: 2019/1/28
 * Time: 4:35 PM
 */

namespace app\admin\validate;


class Order extends Base
{

    protected $rule = [
        'id|主键ID' => 'require|number',
        'status|参数' => 'require|in:2,3',
        'remark|原因' => 'requireIf:status,3'
    ];

}