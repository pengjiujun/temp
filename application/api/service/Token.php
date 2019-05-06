<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/29 0029
 * Time: 下午 2:07
 */

namespace app\api\service;

class Token extends BaseService
{
    /**
     * 获取token
     * @param $user
     */
    public function get($user)
    {
        $this->success('操作成功', $this->saveToCache($user));
    }

    /**
     * 保存token到缓存
     * @param $cachedValue
     *
     * @return string
     */
    private function saveToCache($cachedValue)
    {
        $key = self::generateToken();

        $value = json_encode($cachedValue);

        $expire_in = app()->config->get('token.expire_in');  //缓存过期时间

        $request = app()->cache->set($key, $value, $expire_in);

        if (!$request) {
            $this->error('服务器缓存异常');
        }
        return $key;
    }

    // 生成令牌
    public static function generateToken()
    {
        $randChar = getRandChar(32);
        $tokenSalt = app()->config->get('token.salt');
        $timestamp = $_SERVER['REQUEST_TIME_FLOAT'];

        return md5($randChar . $timestamp . $tokenSalt);
    }
}
