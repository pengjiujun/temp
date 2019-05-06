<?php
namespace app\common\controller;

use org\Auth;
use think\Controller;
use think\Db;
use think\Loader;
use think\Model;

/**
 * 后台公用基础控制器
 * Class AdminBase
 * @package app\common\controller
 */
class AdminBase extends Controller
{
    public $size = 10;

    protected $assign = [];

    protected function initialize()
    {
        parent::initialize();

        $this->checkAuth();
        $this->getMenu();

        // 输出当前请求控制器（配合后台侧边菜单选中状态）
        $this->assign('controller', Loader::parseName($this->request->controller()));
        $this->assign('action', $this->request->action());

        $this->size = $this->request->param('size/d', 10);
    }

    /**
     * 权限检查
     * @return bool
     */
    protected function checkAuth()
    {

        if (!app()->session->has('admin_id')) {
            $this->redirect('admin/login/index');
        }

        $module     = $this->request->module();
        $controller = $this->request->controller();
        $action     = $this->request->action();

        // 排除权限
        $not_check = ['admin/Index/index', 'admin/AuthGroup/getjson', 'admin/System/clear', 'admin/Index/getcharts'
            ,'admin/Company/add','admin/Company/save'];

        if (!in_array($module . '/' . $controller . '/' . $action, $not_check)) {
            $auth     = new Auth();
            $admin_id = app()->session->get('admin_id');
            if (!$auth->check($module . '/' . $controller . '/' . $action, $admin_id) && $admin_id != 1) {
                $this->error('没有权限');
            }
        }
    }

    /**
     * 获取侧边栏菜单
     */
    protected function getMenu()
    {
        $menu     = [];
        $admin_id = app()->session->get('admin_id');
        $auth     = new Auth();

        $auth_rule_list = Db::name('auth_rule')->where('status', 1)->order(['sort' => 'DESC', 'id' => 'ASC'])->select();

        foreach ($auth_rule_list as $value) {
            if ($auth->check($value['name'], $admin_id)) {
                $menu[] = $value;
            }
        }
        $menu = !empty($menu) ? array2tree($menu) : [];

        $this->assign('menu', $menu);
    }

    /**
     * @param $result
     * @param $model \think\Model
     */
    protected function response($result, Model $model)
    {
        if ($result !== false) {
            $this->success(lang('ok'));
        } else {
            $this->error(lang('error', [$model->getError() ?: '操作失败']));
        }
    }

    /**
     * js脚本
     * @param $msg
     *
     * @return string
     */
    protected function js($msg)
    {
        $html = <<<EOF
<script>
    alert("{$msg}");
    window.history.back();
</script>
EOF;
        return $html;
    }
}