<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用容器绑定定义
return [
    'order' => \app\common\service\OrderService::class,     //订单服务
    'area' => \app\common\service\AreaService::class,       //地区代码服务
    'baidu' => \app\common\service\BaiduApiService::class,  //百度API服务
    'pay' => \app\common\service\PayService::class,  //支付
];
