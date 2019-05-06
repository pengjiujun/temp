<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\21 0021
 * Time: 18:07
 */

namespace app\common\service;

use app\common\model\OrderCar;

trait CarTrait
{

    /**
     * 保存投保车辆信息
     * @param array $data
     * @return array
     */
    public function saveCar(array $data) : array
    {
        try {
            if (isset($data['id'])) {
                $id = max(0, intval($data['id']));
                if (empty($id)) {
                    return ['code' => 1, 'msg' => '主键ID错误'];
                }
                $model = OrderCar::get($id);
                if (empty($model)) {
                    return ['code' => 1, 'msg' => '数据不存在'];
                }
            } else {
                $model = new OrderCar();
            }
            isset($data['order_id']) && $model->order_id = $data['order_id'];
            isset($data['plate_no']) && $model->plate_no = $data['plate_no'];
            isset($data['owner']) && $model->owner = $data['owner'];
            isset($data['vin']) && $model->vin = $data['vin'];
            isset($data['engine']) && $model->engine = $data['engine'];
            isset($data['price']) && $model->price = $data['price'];
            isset($data['license_original']) && $model->license_original = $data['license_original'];
            isset($data['license_copy']) && $model->license_copy = $data['license_copy'];
            isset($data['is_new']) && $model->is_new = $data['is_new'];
            isset($data['invoice']) && $model->invoice = $data['invoice'];
            $model->save();
            return ['code' => 0, 'msg' => '保存成功', 'data' => ['id' => $model->id]];
        }catch (\Exception $e){
            return ['code' => 1, 'msg' => $e->getMessage()];
        }
    }

}