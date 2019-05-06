<?php

namespace app\api\controller;

use app\common\controller\ApiBase;

/**
 * 用户
 * Class User
 *
 * @package \app\api\controller
 */
class User extends ApiBase
{
    /**
     * 退出
     */
    public function logout()
    {
        $this->app->cache->rm($this->token);
        $this->user = '';

        $this->redirect('/');
    }
}