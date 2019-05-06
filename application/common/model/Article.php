<?php
namespace app\common\model;

use think\facade\Session;

/**
 * 文章广告
 * Class Article
 *
 * @package app\common\model
 */
class Article extends Base
{
    /**
     * 文章作者
     * @param $value
     * @return mixed
     */
    protected function setAuthorAttr($value)
    {
        return $value ? $value : Session::get('admin_name');
    }

    /**
     * 反转义HTML实体标签
     * @param $value
     * @return string
     */
    protected function setContentAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    /**
     * 序列化photo图集
     * @param $value
     * @return string
     */
    /*protected function setPhotoAttr($value)
    {
        return serialize($value);
    }*/

    /**
     * 反序列化photo图集
     * @param $value
     * @return mixed
     */
    /*protected function getPhotoAttr($value)
    {
        return unserialize($value);
    }*/
}