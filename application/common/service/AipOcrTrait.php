<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\23 0023
 * Time: 14:00
 */

namespace app\common\service;


trait AipOcrTrait
{

    //身份证识别
    public function idcard($imageUrl, $cardSide = 'front')
    {
        if($imageUrl && in_array($cardSide,['front','back'])) {
            $file = env('root_path').'public'.$imageUrl;
            $is_exist = file_exists($file);
            if ($is_exist) {
                $image = file_get_contents($file);
                return $this->_client->idcard($image, $cardSide);
            }
        }
        return ['code' => 1, 'msg' => '参数错误'];
    }

    //行驶证识别
    public function vehicleLicense($imageUrl)
    {
        if($imageUrl) {
            $file = env('root_path').'public'.$imageUrl;
            $is_exist = file_exists($file);
            if ($is_exist) {
                $image = file_get_contents($file);
                return $this->_client->vehicleLicense($image);
            }
        }
        return ['code' => 1, 'msg' => '参数错误'];
    }

    //营业执照识别
    public function businessLicense($imageUrl)
    {
        if($imageUrl) {
            $file = env('root_path').'public'.$imageUrl;
            $is_exist = file_exists($file);
            if ($is_exist) {
                $image = file_get_contents($file);
                return $this->_client->businessLicense($image);
            }
        }
        return ['code' => 1, 'msg' => '参数错误'];
    }

}