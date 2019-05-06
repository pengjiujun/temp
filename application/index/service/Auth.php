<?php

namespace app\index\service;

/**
 * Class Auth
 *
 * @package \app\index\service
 */
class Auth extends BaseService
{
    /**
     * 获取密码
     * @param $password
     * @param $salt
     *
     * @return string
     */
    public static function getPassword($password, $salt)
    {
        return md5($password . $salt);
    }

    public function checkPassword()
    {

    }

}