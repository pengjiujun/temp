<?php
namespace app\common\model;

/**
 * 用户
 * Class User
 *
 * @package app\common\model
 * @property $mobile
 * @property $id
 * @property-read \app\common\model\Insured $insured
 */
class User extends Base
{
    protected $observerClass = \app\common\event\User::class;

    protected $type = [
        'last_login_time' => 'timestamp'
    ];

    /**
     * 银行卡
     * @return \think\model\relation\HasMany
     */
    public function bankcard()
    {
        return $this->hasMany('Bankcard', 'uid');
    }

    /**
     * 用户还款账单
     * @return \think\model\relation\HasMany
     */
    public function bill()
    {
        return $this->hasMany('Bill', 'uid');
    }

    /**
     * 被保人
     * @return \think\model\relation\HasOne
     */
    public function insured()
    {
        return $this->hasOne('Insured', 'uid');
    }
}