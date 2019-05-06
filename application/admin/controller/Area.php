<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\21 0021
 * Time: 14:44
 */

namespace app\admin\controller;

use app\common\controller\AdminBase;

class Area extends AdminBase
{

    public function getcity($pid)
    {
        $city = app('area')->getArea($pid);
        $this->result($city);
    }

}