<?php
use think\facade\Route;

/**
 * admin后台路由
 */

//首页图表数据
Route::get('charts', 'admin/Index/getCharts');

/*
 * 管理员用户
 */
Route::group('a', function () {
    /*Route::get('index', 'admin/AdminUser/index');
    Route::get('add', 'admin/AdminUser/add');
    Route::post('save', 'admin/AdminUser/save');
    Route::post('update/:id', 'admin/AdminUser/update');
    Route::get('edit/:id', 'admin/AdminUser/edit');
    Route::get('delete/:id', 'admin/AdminUser/delete');*/
    source('AdminUser');
})->model('app\common\model\AdminUser');

/*
 * 系统配置
 */
Route::group('system', function () {
    //修改网站配置
    Route::post('site/[:id]', 'admin/System/updateSiteConfig');
    source('system');
})->model('app\common\model\System');

/*
 * 文章管理
 */
Route::group('article', function () {
    source('Article');
})->model('app\common\model\Article');

/*
 * 保险公司
 */
Route::group('company', function () {
    source('Company');
    Route::any('ibec/:id', "admin/Company/ibec");
})->model('app\common\model\InsuranceCompany');

//删除经济公司
Route::post('company/deleteIbec/:id', "admin/Company/deleteIbec")
    ->model('app\common\model\Ibec');
/*
 * 保险产品
 */
Route::group('product', function () {
    source('Product');
})->model('app\common\model\Product');

Route::group('investor', function (){
    source('Investor');
})->model('app\common\model\Investor');

/**
 * 资源路由
 * @param $controller
 */
function source($controller)
{
    Route::get('index', "admin/{$controller}/index");
    Route::get('add', "admin/{$controller}/add");
    Route::post('save', "admin/{$controller}/save");
    Route::post('update/:id', "admin/{$controller}/update");
    Route::get('edit/:id', "admin/{$controller}/edit");
    Route::get('delete/:id', "admin/{$controller}/delete");
}
