<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\21 0021
 * Time: 14:03
 */

namespace app\common\service;

use app\common\model\Area;

class AreaService
{

    public function getArea($pid = 0)
    {
        return Area::where('area_parent_id', $pid)->select()->toArray();
    }

}