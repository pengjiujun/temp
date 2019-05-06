<?php
namespace app\admin\controller;

use app\common\model\AdminUser as AdminUserModel;
use app\common\model\AuthGroup as AuthGroupModel;
use app\common\controller\AdminBase;

/**
 * 管理员管理
 * Class AdminUser
 * @package app\admin\controller
 */
class AdminUser extends AdminBase
{
    /**
     * 管理员管理
     * @param \app\common\model\AdminUser $adminUser
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(AdminUserModel $adminUser)
    {
        $data = $this->request->param();
        $session = $this->app->session;

        $query = $adminUser->withSearch(['keyword', 'sort'], [
            'custom' => 'username',
            'keyword' => $data['keyword'] ?? '',
            'sort' => ['id' => 'desc']
        ]);

        //经销商登录只显示经销商下面的用户
        if (intval($session->get('admin_group_id')) === AuthGroupModel::DEALER) {
            $query->where('pid', $session->get('admin_id'));
        }

        $admin_user_list = $query->paginate($this->size, false, array_query($data));

        return $this->fetch('index', ['admin_user_list' => $admin_user_list]);
    }

    /**
     * 添加管理员
     * @param \app\common\model\AuthGroup $authGroup
     *
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add(AuthGroupModel $authGroup)
    {
        $auth_group_list = $authGroup->getLists();

        if ($auth_group_list->isEmpty()) {
            return $this->js('权限组为空,无法添加');
        }

        return $this->fetch('add', ['auth_group_list' => $auth_group_list]);
    }

    /**
     * 保存管理员
     * @param \app\common\model\AdminUser $adminUser
     *
     * @throws \think\Exception
     */
    public function save(AdminUserModel $adminUser)
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();

            $result = $adminUser->allowField(true)->save($data);

            if ($result !== false) {
                $adminUser->authGroup()->attach($data['group_id']);
            }

            $this->response($result, $adminUser);
        }
    }

    /**
     * 编辑管理员
     * @param \app\common\model\AdminUser $adminUser
     * @param \app\common\model\AuthGroup $authGroup
     *
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit(AdminUserModel $adminUser, AuthGroupModel $authGroup)
    {
        $auth_group_list = $authGroup->getLists();

        return $this->fetch('edit', ['admin_user' => $adminUser, 'auth_group_list' => $auth_group_list]);
    }

    /**
     * 更新管理员
     * @param \app\common\model\AdminUser $adminUser
     *
     * @throws \think\Exception
     */
    public function update(AdminUserModel $adminUser)
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();

            $password = $data['password'] ?? null;
            $confirm_password = $data['confirm_password'] ?? null;
            if (!$password || !$confirm_password) {
                unset($data['password']);
            }

            $result = $adminUser->allowField(true)->isUpdate(true)->save($data);

            if ($result !== false) {
                $adminUser->authGroup()->detach();
                $adminUser->authGroup()->attach($data['group_id']);
            }

            $this->response($result, $adminUser);
        }
    }

    /**
     * 删除管理员
     * @param \app\common\model\AdminUser $adminUser
     *
     * @throws \Exception
     */
    public function delete(AdminUserModel $adminUser)
    {
        $result = $adminUser->delete();

        if ($result !== false) {
            $adminUser->authGroup()->detach();
        }

        $this->response($result, $adminUser);
    }
}
