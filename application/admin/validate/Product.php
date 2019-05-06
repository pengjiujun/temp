<?php
namespace app\admin\validate;

use app\common\model\Product as ProductModel;

class Product extends Base
{
    protected $rule = [
        'name|产品名称' => 'require|max:255',
        'stage|分期期数' => 'require|number',
        'type|产品类型' => 'require',
        'object|分期标的' => 'require',
        'charge|收费方式' => 'require|in:'.ProductModel::STAGE.','.ProductModel::ALL,
        'rate|服务费费率' => 'require|number',
        'premium|保费总额' => 'require|number'
    ];
}