<?php
namespace app\admin\validate;

class Article extends Base
{
    protected $rule = [
        'title|标题' => 'require',
        'introduction|简介' => 'require|max:255',
        'content|内容' => 'require',
    ];
}