<?php

namespace app\common\behavior;

/**
 * 验证码
 * Class Sms
 *
 * @package \app\common\behavior
 */
class Sms
{
    /**
     * 获取最后一次手机发送的数据
     * @param $param
     *
     * @return bool
     */
    public function smsGet($param)
    {
        return true;
    }

    /**
     * 发送验证码
     * @param $param
     *
     * @return bool
     */
    public function smsSend($param)
    {
        return true;
    }

    /**
     * 检查验证码
     * @param $param
     *
     * @return bool
     */
    public function smsCheck($param)
    {
        return true;
    }

    /**
     * 发送通知
     * @param $param
     *
     * @return bool
     */
    public function smsNotice($param)
    {
        return true;
    }

    /**
     * 清空指定手机号验证码
     * @param $param
     *
     * @return bool
     */
    public function smsFlush($param)
    {
        return true;
    }
}