<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\21 0021
 * Time: 18:30
 */

namespace app\common\service;


use app\common\model\OrderExtra;

trait OrderExtTrait
{

    /**
     * 保存订单扩展信息
     * @param array $data
     * @return array
     */
    public function saveOrderExt(array $data) : array
    {
        try {
            if (isset($data['id'])) {
                $id = max(0, intval($data['id']));
                if (empty($id)) {
                    return ['code' => 1, 'msg' => '主键ID错误'];
                }
                $model = OrderExtra::get($id);
                if (empty($model)) {
                    return ['code' => 1, 'msg' => '数据不存在'];
                }
                $model->update_time = time();
            } else {
                $model = new OrderExtra();
                $model->create_time = time();
            }
            isset($data['order_id']) && $model->order_id = $data['order_id'];
            isset($data['investor']) && $model->investor = $data['investor'];
            isset($data['policy']) && $model->policy = $data['policy'];
            isset($data['policy_no']) && $model->policy_no = $data['policy_no'];
            isset($data['policy_expiry']) && $model->policy_expiry = $data['policy_expiry'];
            isset($data['policy_update']) && $model->policy_update = $data['policy_update'];
            isset($data['policy_img']) && $model->policy_img = $data['policy_img'];
            isset($data['endorsement']) && $model->endorsement = $data['endorsement'];
            isset($data['receipt']) && $model->receipt = $data['receipt'];
            $model->save();
            return ['code' => 0, 'msg' => '保存成功', 'data' => ['id' => $model->id]];
        }catch (\Exception $e){
            return ['code' => 1, 'msg' => $e->getMessage()];
        }
    }

}