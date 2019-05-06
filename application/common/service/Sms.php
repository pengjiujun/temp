<?php

namespace app\common\service;

use think\facade\Hook;
use app\common\model\Sms as SmsModel;

/**
 * 短信验证码类
 */
class Sms
{
    /**
     * 验证码有效时长
     * @var int
     */
    protected static $expire = 300;

    /**
     * 最大允许检测的次数
     * @var int
     */
    protected static $maxCheckNums = 10;

    /**
     *  获取最后一次手机发送的数据
     *
     * @param   int       $mobile   手机号
     * @return null|\app\common\model\Sms
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function get($mobile)
    {
        $sms = SmsModel::where(['mobile' => $mobile])
            ->order('id', 'DESC')
            ->find();
        Hook::listen('sms_get', $sms, true);
        return $sms ?: null;
    }

    /**
     * 发送验证码
     * @param   int       $mobile   手机号
     * @param   int       $code     验证码,为空时将自动生成4位数字
     *
     * @return bool
     * @throws \Exception
     */
    public static function send($mobile, $code = null)
    {
        $code = is_null($code) ? mt_rand(1000, 9999) : $code;

        /*
         * 本地调试验证码为local
         */
        if (app()->env->get('app.level') === 'debug') {
            $code = 1234;
        }

        $sms = SmsModel::create(['mobile' => $mobile, 'code' => $code]);

        $result = Hook::listen('sms_send', $sms, true);
        if (!$result) {
            $sms->delete();
            return false;
        }
        return true;
    }

    /**
     * 发送通知
     *
     * @param   mixed     $mobile   手机号,多个以,分隔
     * @param   string    $msg      消息内容
     * @param   string    $template 消息模板
     * @return  boolean
     */
    public static function notice($mobile, $msg = '', $template = null)
    {
        $params = [
            'mobile'   => $mobile,
            'msg'      => $msg,
            'template' => $template
        ];
        $result = Hook::listen('sms_notice', $params, true);
        return $result ? true : false;
    }

    /**
     * 校验验证码
     *
     * @param   int       $mobile     手机号
     * @param   int       $code       验证码
     *
     * @return bool|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function check($mobile, $code)
    {
        $time = time() - self::$expire;

        $sms = SmsModel::where(['mobile' => $mobile])
            ->order('id', 'DESC')
            ->find();
        if ($sms) {
            if ($sms->getData('create_time') > $time && $sms['num'] <= self::$maxCheckNums) {
                $correct = $code == $sms['code'];

                if (!$correct) {
                    $sms->num = $sms->num + 1;
                    $sms->save();
                    return false;
                } else {
                    $result = Hook::listen('sms_check', $sms, true);
                    return $result;
                }
            } else {
                // 过期则清空该手机验证码
                self::flush($mobile);
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * 清空指定手机号验证码
     * @param   int       $mobile     手机号
     *
     * @return bool
     * @throws \Exception
     */
    public static function flush($mobile)
    {
        SmsModel::where(['mobile' => $mobile])->delete();
        Hook::listen('sms_flush');
        return true;
    }
}
