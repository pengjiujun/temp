<?php
namespace app\admin\validate;

class Company extends Base
{
    protected $rule = [
        'name|保险公司名称' => 'require|max:255|unique:InsuranceCompany'
    ];
}