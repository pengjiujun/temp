<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use app\common\model\AdminUser;

/**
 * 后台登录
 * Class Login
 * @package app\admin\controller
 */
class Login extends Controller
{
    /**
     * 后台登录
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 登录验证
     * @return string
     */
    public function login()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->only(['username', 'password', 'verify']);
            $validate_result = $this->validate($data, 'Login');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $where['username'] = Db::raw(" = BINARY'{$data['username']}'");
                $where['password'] = md5($data['password'] . app()->config->get('salt'));

                $admin_user = AdminUser::field('id,username,status,pid')->where($where)->find();

                if (!empty($admin_user)) {
                    if ($admin_user['status'] != 1) {
                        $this->error('当前用户已禁用');
                    } else {
                        app()->session->set('admin_id', $admin_user['id']);
                        app()->session->set('admin_name', $admin_user['username']);
                        app()->session->set('admin_group_id', $admin_user->auth_group[0]['id'] ?? 0);
                        app()->session->set('admin_pid', $admin_user['pid']);
                        Db::name('admin_user')->update(
                            [
                                'last_login_time' => time(),
                                'last_login_ip'   => $this->request->ip(),
                                'id'              => $admin_user['id']
                            ]
                        );
                        $this->success('登录成功', 'admin/index/index');
                    }
                } else {
                    $this->error('用户名或密码错误');
                }
            }
        }
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        app()->session->delete('admin_id');
        app()->session->delete('admin_name');
        $this->redirect('admin/login/index');
    }
}
