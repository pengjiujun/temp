<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\18 0018
 * Time: 18:16
 */

namespace app\common\service;

use app\common\model\Order;
use think\Db;

class OrderService
{

    protected $page = 1;
    protected $pageSize = 15;

    use InsuredTrait;   //被保人(还款人)服务
    use CarTrait;       //投保车辆信息服务
    use OrderExtTrait;  //订单扩展服务

    /**
     * 保存订单信息
     * @param array $data
     * @return array
     */
    public function saveOrder(array $data) : array
    {
        try{
            if (isset($data['id'])) {
                $id = max(0, intval($data['id']));
                if (empty($id)) {
                    return ['code' => 1, 'msg' => '主键ID错误'];
                }
                $model = Order::get($id);
                if (empty($model)) {
                    return ['code' => 1, 'msg' => '数据不存在'];
                }
                $model->update_time = time();
            } else {
                $model = new Order();
                $model->create_time = time();
            }
            isset($data['order_sn']) && $model->order_sn = $data['order_sn'];
            isset($data['insured_id']) && $model->insured_id = $data['insured_id'];
            isset($data['product_id']) && $model->product_id = $data['product_id'];
            isset($data['company_id']) && $model->company_id = $data['company_id'];
            isset($data['premium']) && $model->premium = $data['premium'];
            isset($data['service']) && $model->service = $data['service'];
            isset($data['status']) && $model->status = $data['status'];
            isset($data['remark']) && $model->remark = $data['remark'];
            isset($data['stage']) && $model->stage = $data['stage'];
            isset($data['repayment']) && $model->repayment = $data['repayment'];
            isset($data['type']) && $model->type = $data['type'];
            isset($data['verify']) && $model->verify = $data['verify'];
            isset($data['is_face']) && $model->is_face = $data['is_face'];
            isset($data['is_sign']) && $model->is_sign = $data['is_sign'];
            isset($data['is_bank']) && $model->is_bank = $data['is_bank'];
            isset($data['is_renewal']) && $model->is_renewal = $data['is_renewal'];
            isset($data['salesman_id']) && $model->salesman_id = $data['salesman_id'];
            isset($data['admin_id']) && $model->admin_id = $data['admin_id'];
            $model->save();
            return ['code' => 0, 'msg' => '保存成功', 'data' => ['id' => $model->id]];
        }catch (\Exception $e){
            return ['code' => 1, 'msg' => $e->getMessage()];
        }
    }

    public function search($param)
    {
        $query = Db::name('order')->alias('o');
        $query->leftJoin('insured i', 'o.insured_id = i.id');
        $query->leftJoin('product p', 'o.product_id = p.id');
        $query->leftJoin('order_car c', 'o.id = c.order_id');
        $query->leftJoin('order_extra e', 'o.id = e.order_id');
        if(isset($param['keyword']) && $param['keyword']){
            $query->where(function ($query) use($param) {
                $query->whereOr('o.order_sn', 'like', "%{$param['keyword']}%");
                $query->whereOr('i.name|i.mobile', 'like', "%{$param['keyword']}%");
                $query->whereOr('p.name', 'like', "%{$param['keyword']}%");
                $query->whereOr('c.plate_no|c.vin', 'like', "%{$param['keyword']}%");
                $query->whereOr('e.policy_no', 'like', "%{$param['keyword']}%");
            });
        }
        if(isset($param['status']) && $param['status']){
            $query->where('o.status', $param['status']);
        }
        if(isset($param['repayment']) && $param['repayment']){
            $query->where('o.repayment', $param['repayment']);
        }
        if(isset($param['type']) && $param['type']){
            $query->where('o.type', $param['type']);
        }
        if(isset($param['is_renewal']) && $param['is_renewal']){
            $query->where('o.is_renewal', $param['is_renewal']);
        }
        if(isset($param['admin_id']) && $param['admin_id']){
            $query->whereIn('o.admin_id', $param['admin_id']);
        }
        if(isset($param['start_time']) && $param['start_time']){
            $query->where('o.create_time', '>=', $param['start_time']);
        }
        if(isset($param['end_time']) && $param['end_time']){
            $query->where('o.create_time', '<=', $param['end_time']);
        }
        $query->field('o.id,o.order_sn,o.insured_id,o.product_id,o.company_id,o.premium as order_premium,o.service,o.status,o.remark as order_remark,o.stage as order_stage,o.repayment,o.type as order_type,o.verify,o.is_renewal,o.salesman_id,o.admin_id,o.create_time,o.update_time,
        i.uid,i.type as insured_type,i.is_legal,i.name as insured_name,i.mobile,i.card,i.card_front,i.card_con,i.province,i.city,i.address,i.agreement,i.enterprise,i.enterprise_license,i.code,i.expiry,i.legal,i.legal_card,i.account,i.bank,
        p.name as product_name,p.stage as product_stage,p.rate,p.type as product_type,p.object,p.charge,p.premium as product_premium,
        c.plate_no,c.owner,c.vin,c.engine,c.price as car_price,c.license_original,c.license_copy,c.is_new,c.invoice,
        e.investor,e.policy,e.policy_no,e.policy_expiry,e.policy_update,e.policy_img,e.endorsement,e.receipt');
//        $result = $query->paginate($this->pageSize);
        $result = $query->paginate($this->pageSize)->each(function($item){
            $salesman_id = $item['salesman_id'];
            $admin_id = $item['admin_id'];
            $item['salesman_name'] = Db::name('admin_user')->where("id='$salesman_id'")->value('username');
            $item['admin_name'] = Db::name('admin_user')->where("id='$admin_id'")->value('username');
            $item['company_name'] = Db::name('insurance_company')->where("id='{$item['company_id']}'")->value('name');
            return $item;
        });
        return $result;
    }

    public function getOrderCountByDay($day = 0)
    {
        $day = $day ?: date('j');
        $startTime = mktime(0, 0, 0, date('n'), $day);
        $endTime = mktime(0, 0, 0, date('n'), $day + 1);
        return Order::where([['create_time','>=',$startTime],['create_time','<=',$endTime]])->count();
    }

    public function getOrderAmountByDay($day = 0)
    {
        $day = $day ?: date('j');
        $startTime = mktime(0, 0, 0, date('n'), $day);
        $endTime = mktime(0, 0, 0, date('n'), $day + 1);
        return Order::where([['create_time','>=',$startTime],['create_time','<=',$endTime]])->sum('premium');
    }

    public function getOrderCount()
    {
        return Order::count();
    }

    public function getOrderAmount()
    {
        return Order::sum('premium');
    }

}