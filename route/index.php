<?php
use think\facade\Route;

/**
 * api前台路由
 */
Route::group('api', function () {
    //签约支付
    Route::post('pay', 'index/Pay/pay');

    //银行卡签约短信
    Route::post('sendBind', 'index/Pay/sendBind');

    //银行卡签约
    Route::post('bind', 'index/Pay/bind');

    //银行卡解约
    Route::post('unbind', 'index/Pay/unbind');

    //协议退款
    Route::post('refund', 'index/Pay/refund');

    //查询交易
    Route::get('search', 'index/Pay/search');

    //批量支付
    Route::post('pays', 'index/Pay/pays');
});

/**
 * index前台路由
 */
//用户中心
Route::get('user', 'index/User/index');

//发送验证码
Route::post('captcha', 'index/Login/sendSms');

//退出
Route::get('logout', 'index/User/logout');

//登录
Route::get('login', 'index/Login/login')->name('login');
Route::post('login', 'index/Login/check');
Route::get('captcha_login', 'index/Login/captchaLogin')->name('captcha_login');

//注册
Route::get('register', 'index/Login/register')->name('register');
Route::post('register', 'index/Login/checkRegister');

Route::group('user', function () {
    //银行卡
    Route::get('bankcard', 'index/User/bankcard')->name('bankcard');
    //银行卡实名验证
    Route::get('bankcard_verify/[:order_id]', 'index/User/bankcardVerify')->name('bankcard_verify');
    //账单
    Route::get('bill', 'index/User/bill')->name('bill');
    //保单
    Route::get('orders', 'index/User/orders')->name('orders');
});

/*
 * 签约验证
 */

Route::group('', function () {
    //验证页面
    Route::get('verify/:id', 'index/Order/verify')->name('verify');
    //签约
    Route::get('contract/:id', 'index/Order/contract')->name('contract');
    //银行卡签约短信发送
    Route::post('bankcard_send/[:id]', 'index/Order/bankSend');
    //银行卡验证
    Route::post('bankcard_verify/[:id]', 'index/Order/bankcardVerify');
    //合同签署
    Route::post('contract/:id', 'index/Order/contractVerify');
})->model(\app\common\model\Order::class);
