<?php

namespace app\common\lib;

use app\common\exception\AppValidateException;
use think\facade\Request;

class Validate
{
    /**
     * Validate constructor.
     *
     * @throws \app\common\exception\AppValidateException
     */
    public function __construct()
    {
        $this->validateParam();
    }

    /**
     * 根据控制器和方法验证输入变量
     * @return bool
     * @throws AppValidateException
     */
    protected function validateParam()
    {
        $class = 'app\\'.Request::module().'\validate\\'.Request::controller();
        if (class_exists($class)&&app($class)->hasScene(strtolower(Request::action()))) {
            if (app($class)->scene(Request::action())->check(Request::param())) {
                return true;
            } else {
                throw new AppValidateException(app($class)->getError());
            }
        } else {
            return true;
        }
    }
}
