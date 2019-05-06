<?php

/*
 * admin模块中间件
 */
return [
    \app\http\middleware\Validate::class, //验证器
    \app\http\middleware\Template::class, //应用配置
];
