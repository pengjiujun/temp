<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\18 0018
 * Time: 18:22
 */

namespace app\common\service;

use app\common\model\Insured;

trait InsuredTrait
{

    /**
     * 保存被保人(还款人)
     * @param array $data
     * @return array
     */
    public function saveInsured(array $data) : array
    {
        try {
            if (isset($data['id'])) {
                $id = max(0, intval($data['id']));
                if (empty($id)) {
                    return ['code' => 1, 'msg' => '主键ID错误'];
                }
                $model = Insured::get($id);
                if (empty($model)) {
                    return ['code' => 1, 'msg' => '数据不存在'];
                }
            } else {
                $model = new Insured();
            }
            isset($data['uid']) && $model->uid = $data['uid'];
            isset($data['admin_id']) && $model->admin_id = $data['admin_id'];
            isset($data['type']) && $model->type = $data['type'];
            isset($data['is_legal']) && $model->is_legal = $data['is_legal'];
            isset($data['name']) && $model->name = $data['name'];
            isset($data['mobile']) && $model->mobile = $data['mobile'];
            isset($data['card']) && $model->card = $data['card'];
            isset($data['card_front']) && $model->card_front = $data['card_front'];
            isset($data['card_con']) && $model->card_con = $data['card_con'];
            isset($data['province']) && $model->province = $data['province'];
            isset($data['city']) && $model->city = $data['city'];
            isset($data['address']) && $model->address = $data['address'];
            isset($data['agreement']) && $model->agreement = $data['agreement'];
            isset($data['enterprise']) && $model->enterprise = $data['enterprise'];
            isset($data['enterprise_license']) && $model->enterprise_license = $data['enterprise_license'];
            isset($data['code']) && $model->code = $data['code'];
            isset($data['expiry']) && $model->expiry = $data['expiry'];
            isset($data['legal']) && $model->legal = $data['legal'];
            isset($data['legal_card']) && $model->legal_card = $data['legal_card'];
            isset($data['account']) && $model->account = $data['account'];
            isset($data['bank']) && $model->bank = $data['bank'];
            $model->save();
            return ['code' => 0, 'msg' => '保存成功', 'data' => ['id' => $model->id]];
        }catch (\Exception $e){
            return ['code' => 1, 'msg' => $e->getMessage()];
        }
    }

    /**
     * 根据后台用户ID查询客户信息
     * @param $adminId
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getInsuredByAdminId($adminId) : array
    {
        if($adminId){
            $where['admin_id'] = $adminId;
            return Insured::where($where)->select()->toArray();
        }
        return [];
    }

    /**
     * 根据手机号查询客户信息
     * @param $mobile
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getInsuredByMobile($mobile)
    {
        if($mobile && strlen($mobile) == 11){
            $data = Insured::where('mobile', $mobile)->find();
            return $data ? $data->toArray() : [];
        }
        return [];
    }

}