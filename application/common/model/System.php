<?php

namespace app\common\model;

/**
 * 系统配置
 * Class System
 *
 * @package \app\common\model
 */
class System extends Base
{
    const  SITE = 'site_config';

    public static function init()
    {
        parent::init();

        self::beforeDelete(function ($model) {
            if (intval($model->is_default) === 1) {
                $model->error = '默认配置不能删除';
                return false;
            }
        });
    }

    /**
     * 获取默认配置
     * @return mixed
     */
    public static function defaultConfig()
    {
        $result = self::where('name', self::SITE)->value('value');
        if ($result) {
            $result = unserialize($result);
        } else {
            $result = [];
        }
        return $result;
    }

    /**
     * 获取首页配置
     * @return array|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getHome()
    {
        return static::field('value,name,id,description')
            ->where('name', 'neq', self::SITE)
            ->where('is_default', 1)
            ->select();
    }

    /**
     * 站点配置
     */
    public function getSite()
    {
        return static::field('value,name,id')->where('name', self::SITE)->findOrEmpty();
    }

    /**
     * 站点配置解序列化
     * @param $value
     * @param $data
     *
     * @return mixed
     */
    public function getValueAttr($value, $data)
    {
        if ($data['name'] === self::SITE) {
            return unserialize($value);
        }

        return $value;
    }

    /**
     * 站点配置序列化
     * @param $value
     * @param $data
     *
     * @return string
     */
    public function setValueAttr($value, $data)
    {
        if (isset($data['name']) && $data['name'] === self::SITE) {
            return serialize($value);
        }

        return $value;
    }
}
