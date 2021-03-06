<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\23 0023
 * Time: 11:40
 */

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\AdminUser;
use app\common\model\Order as OrderModel;

class Order extends AdminBase
{

    protected $adminId;
    protected $adminPid;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->adminId = session('admin_id');
        $this->adminPid = session('admin_pid');
    }

    /**
     * @return mixed
     */
    public function index()
    {

        $data = $this->request->param();
        $admin_id = AdminUser::where('pid', $this->adminId)->column('id');
        $data['admin_id'] = $admin_id;
        $data = app('order')->search($data);
        $todayCount = app('order')->getOrderCountByDay();
        $todayAmount = app('order')->getOrderAmountByDay();
        $count = app('order')->getOrderCount();
        $amount = app('order')->getOrderAmount();
        return $this->fetch('index', [
            'data' => $data,
            'status'=>OrderModel::$status,
            'todayCount'=>$todayCount,
            'todayAmount'=>$todayAmount,
            'count'=>$count,
            'amount'=>$amount,
        ]);
    }

    public function auditing()
    {

        $data = $this->request->param();
        $admin_id = AdminUser::where('pid', $this->adminId)->column('id');
        $data['admin_id'] = $admin_id;
        $data['status'] = OrderModel::STATUS_APPLY;
        $data = app('order')->search($data);

        return $this->fetch('auditing', ['data' => $data,'status'=>OrderModel::$status]);
    }

    public function update()
    {
        $id = $this->request->param('id');
        $status = $this->request->param('status');
        $remark = $this->request->param('remark', '');
        $order = OrderModel::get($id);
        if(empty($order)){
            return $this->error('数据不存在');
        }
        $order->status = $status;
        $order->remark = $remark;
        $order->verify = ['inc', 1];
        $result = $order->save();
        if(!$result){
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

}