<?php

namespace app\common\event;

use app\common\model\Insured;
use app\index\service\Token;

/**
 * 用户观察者
 * Class User
 *
 * @package \app\common\event
 */
class User
{
    /**
     * 新增后
     * @param                           $user
     * @param \app\common\model\Insured $insured
     *
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function afterInsert($user, Insured $insured)
    {
        $insured = $insured->where('mobile', $user->mobile)->find();
        if ($insured) {
            $insured->uid = $user->id;
            $insured->save();
        }

        /*
        * 获取token
        */
        $token = Token::get([
            'id' => $user['id'],
            'username' => $user['username'],
            'headimg' => $user['headimg'] ?? '',
            'mobile' => $user['mobile']
        ]);

        app()->cookie->set('token', $token);
    }

    /**
     * 更新后
     * @param \app\common\model\User $user
     */
    public function afterUpdate($user)
    {
    }
}