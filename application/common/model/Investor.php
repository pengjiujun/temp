<?php
/**
 * Created by PhpStorm.
 * User: jack
 * Date: 2019/1/29
 * Time: 11:47 PM
 */

namespace app\common\model;


class Investor extends Base
{

    public function policy()
    {
        return $this->hasMany('PolicyHolder', 'investor_id');
    }

}