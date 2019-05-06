<?php

namespace app\common\exception;

use think\Exception;

/**
 * 应用自定义异常
 * Class AppValidateException
 *
 * @package \app\common\exception
 */
class AppValidateException extends Exception
{
    /**
     * 返回数据
     * @var array
     */
    public $data;
    /**
     * 扩展数据
     * @var array
     */
    public $ext;

    public function __construct($msg, $status = 0, $data = [], $ext = [])
    {
        parent::__construct($msg, $status);

        $this->data     =       $data;
        $this->ext      =       $ext;
    }
}
