<?php

namespace app\index\validate;

use think\Validate;
use app\common\service\Sms;

/**
 * Class Base
 *
 * @package \app\admin\validate
 */
class Base extends Validate
{
    protected $scene = [
        'save' => [],
        'update' => []
    ];

    /**
     * 检查手机验证码
     * @param $value
     * @param $rule
     * @param $data
     *
     * @return bool|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function checkSms($value, $rule, $data)
    {
        return Sms::check($data['mobile'] ?? 0, $value);
    }
}