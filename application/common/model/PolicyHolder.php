<?php
/**
 * Created by PhpStorm.
 * User: jack
 * Date: 2019/1/29
 * Time: 11:47 PM
 */

namespace app\common\model;


class PolicyHolder extends Base
{

    public function investor()
    {
        return $this->belongsTo('Investor', 'investor_id');
    }

}