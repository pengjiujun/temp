<?php

namespace app\common\model;

/**
 * 银行卡
 * Class Bankcard
 *
 * @package \app\common\model
 */
class Bankcard extends Base
{
    /*
     * 身份类型
     */
    const IDENTITY = 0;
    const REGISTER = 1;
    const PASSPORT = 2;
    const ID_TYPE = [
        self::IDENTITY => '身份证',
        self::REGISTER => '户口本',
        self::PASSPORT => '护照'
    ];

    /*
     * 卡类型
     */
    const DEPOSIT = '00';
    const CREDIT = '02';
    const TYPE = [
        self::DEPOSIT => '借记卡',
        self::CREDIT => '信用卡'
    ];

    /*
     * 银行类型
     */
    const GONGSHANG = '0102';
    const NONGYE = '0103';
    const ZHONGGUO = '0104';
    const JIANSHE = '0105';
    const FAZHAN = '0306';
    const ZHAOSHANG = '0308';

    const BANK = [
        self::GONGSHANG => '中国工商银行',
        self::NONGYE => '中国农业银行',
        self::ZHONGGUO => '中国银行',
        self::JIANSHE => '中国建设银行',
        self::FAZHAN => '广东发展银行',
        self::ZHAOSHANG => '招商银行'
    ];

    protected $append = [
        'bank_txt',
        'type_txt',
        'id_type_txt',
        'card_txt'
    ];

    /**
     * 银行文本
     * @param $value
     * @param $data
     *
     * @return mixed|string
     */
    public function getBankTxtAttr($value, $data)
    {
        return self::BANK[$data['bank']] ?? '';
    }

    /**
     * 卡类型
     * @param $value
     * @param $data
     *
     * @return mixed|string
     */
    public function getTypeTxtAttr($value, $data)
    {
        return self::TYPE[$data['type']] ?? '';
    }

    /**
     * 身份类型
     * @param $value
     * @param $data
     *
     * @return mixed|string
     */
    public function getIdTypeTxtAttr($value, $data)
    {
        return self::ID_TYPE[$data['id_type']] ?? '';
    }

    /**
     * 隐藏卡号
     * @param $value
     * @param $data
     *
     * @return string
     */
    public function getCardTxtAttr($value, $data)
    {
        $value = $data['card'] ?? '';

        if ($value) {
            $value = substr_replace($value, '****', -4, 4);
        }

        return $value;
    }

    /**
     * 签约
     */
    public static function sign($param)
    {
        $info = self::field('*')
            ->where('card', $param['account_no'])
            ->find();

        $data = [
            'card' => $param['account_no'], //银行卡号
            'bank' => $param['bank_code'] ?? '',  //银行代码
            'name' => $param['account_name'] ?? '',    //持卡人姓名
            'mobile' => $param['tel'] ?? '', //银行预留手机号
            'is_sign' => 1,
            'is_master' => 1,
            'agrmno' => $param['agrmno'],
            'uid' => app()->session->get('user')['id'] ?? 0, //todo 用户id
        ];

        if ($info) {
            $result = $info->save();
        } else {
            $result = self::create($data);
        }

        return $result;
    }

    /**
     * 解约
     * @param $card
     *
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function unSign($agrmno)
    {
        $info = self::field('card,is_sign')
            ->where('agrmno', $agrmno)
            ->findOrFail();

        $info['is_sign'] = 0;   //是否签约
        $info['agrmno'] = '';   //协议号

        return $info->save();
    }
}