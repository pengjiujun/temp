<?php
namespace app\admin\validate;

/**
 * 配置验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class System extends Base
{
    protected $rule = [
        'name|配置字段'         => 'require|unique:system',
        'description|配置描述'         => 'require',
        'value|配置值'           => 'require'
    ];
}