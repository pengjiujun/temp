<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\23 0023
 * Time: 10:55
 */

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\AdminUser;
use app\common\model\Order;

class Policy extends AdminBase
{

    protected $adminId;
    protected $adminPid;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->adminId = session('admin_id');
        $this->adminPid = session('admin_pid');
    }

    public function index()
    {
        $data = $this->request->param();
        $admin_id = $this->adminId;
        if($this->adminPid == 0) {
            $admin_id = AdminUser::where('pid', $this->adminId)->column('id');
        }
        $data['admin_id'] = $admin_id;
        $data['type'] = Order::TYPE_INSURANCE;
        $data = app('order')->search($data);
        return $this->fetch('index', ['data' => $data,'status'=>Order::$status]);
    }

}