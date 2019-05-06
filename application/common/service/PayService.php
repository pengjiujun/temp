<?php

namespace app\common\service;

use app\common\model\Bankcard;
use app\common\model\Tonglian;
use Pay\Api;
use think\facade\Hook;

/**
 * 支付
 * Class PayService
 *
 * @package \app\common\service
 */
class PayService
{
    /**
     * @var \Pay\Api
     */
    protected $api = null;

    protected $param = [];

    public function __construct($param = [])
    {
        $this->api = new Api();

        if (empty($param)) {
            $param = app()->request->param();
            array_shift($param);
        }

        $this->param = $param;
    }

    /**
     * 生成支付订单编号
     */
    public function makeSn()
    {
        $sn = $this->api->getUsername() . date('YmdHis') . random_int(1000, 9999);

        return $sn;
    }

    /**
     * 单笔实时支付
     */
    public function pay()
    {
    }

    /**
     * 签约支付
     */
    public function signPay()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::PAY_BIND,
            'info' => $this->param
        ]);

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'FASTTRX' => [
                'ACCOUNT_NAME' => $this->param['account_name'],
                'AMOUNT' => $this->param['amount'],
                'AGRMNO' => $this->param['agrmno']
            ]
        ];

        $result = $this->api->setParam($param)->signPay();

        $is_success = $this->parse($result);

        if ($is_success !== true) {
            return $this->format($is_success);
        }

        $code = $result["AIPG"]['FASTTRXRET']['RET_CODE'] ?? false;

        if ($code !== '0000') {
            return $this->format($result['AIPG']['FASTTRXRET']['ERR_MSG'] ?? '');
        }

        //支付成功事件 todo
//        $listen = [];
//        Hook::listen('pay_callback', $listen);

        return $this->format('支付成功', 1);
    }

    /**
     * 签约批量支付
     */
    public function signPays()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::PAYS_BIND,
            'info' => $this->param
        ]);

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'BODY' => [
                'TRANS_SUM' => [
                    //'TOTAL_ITEM' => count($this->param), //总记录数
                    'TOTAL_ITEM' => 3, //总记录数
                    'TOTAL_SUM' => '5000',         //总金额
                ],
                'TRANS_DETAILS' => [
                    'FASTTRX_DETAIL'=> array(
                        'SN' => '00001',
                        'ACCOUNT_NAME'=> '张三',
                        'AGRMNO' => 'AIP7298190125000001986',
//                        'CVV2'=> '',
//                        'VALIDDATE' => '',
                        'AMOUNT'=> '1000',
                    ),
                    'FASTTRX_DETAIL2'=> array(
                        'SN' => '00002',
                        'ACCOUNT_NAME'=> '东东',
                        'AGRMNO' => 'AIP8205190125000023847',
//                        'CVV2'=> '',
//                        'VALIDDATE' => '',
                        'AMOUNT'=> '2000',
                    ),
                    'FASTTRX_DETAIL3'=> array(
                        'SN' => '00003',
                        'ACCOUNT_NAME'=> '东东',
                        'AGRMNO' => 'AIP8205190125000023847',
//                        'CVV2'=> '',
//                        'VALIDDATE' => '',
                        'AMOUNT'=> '2000',
                    ),
                ]
            ],
        ];

        $result = $this->api->setParam($param)->signPays();

        print_r($result);
    }

    /**
     * 发送签约短信
     */
    public function sendBind()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::SEND_BIND,
            'info' => $this->param
        ]);

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'FAGRA' => [
                'ACCOUNT_NO' => $this->param['account_no'],
                'ACCOUNT_NAME' => $this->param['account_name'],
                'ACCOUNT_TYPE' => $this->param['account_type'],
                'ACCOUNT_PROP' => '0',
                'CVV2' => $this->param['cvv2'] ?? '',
                'VAILDDATE' => $this->param['validdate'] ?? '',
                'ID_TYPE' => $this->param['id_type'],
                'ID' => $this->param['idcard'],
                'TEL' => $this->param['tel'],
                'BANK_CODE' => $this->param['bank_code'] ?? ''
            ]
        ];

        $result = $this->api->setParam($param)->sendBind();

        $is_success = $this->parse($result);

        if ($is_success !== true) {
            return $this->format($is_success);
        }

        $code = $result["AIPG"]['FAGRARET']['RET_CODE'] ?? false;

        if ($code !== '0000') {
            return $this->format($result['AIPG']['FAGRARET']['ERR_MSG'] ?? '');
        }

        return $this->format('发送短信成功', 1, $result['AIPG']['INFO']['REQ_SN']);
    }

    /**
     * 签约银行卡
     */
    public function bind()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::BIND,
            'info' => $this->param
        ]);

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'FAGRC' => [
                'SRCREQSN' => $this->param['srcreqsn'],
                'VERCODE' => $this->param['vercode']
            ]
        ];

        $result = $this->api->setParam($param)->bind();

        $is_success = $this->parse($result);

        if ($is_success !== true) {
            return $this->format($is_success);
        }

        $code = $result["AIPG"]['FAGRCRET']['RET_CODE'] ?? false;

        if ($code !== '0000') {
            return $this->format($result['AIPG']['FAGRCRET']['ERR_MSG'] ?? '');
        }

        /*
         * 签约
         */
        $tonglian = Tonglian::where('req_sn', $this->param['srcreqsn'])->findOrFail();

        $param = $tonglian['info'] ?? [];
        $param['agrmno'] = $result["AIPG"]['FAGRCRET']['AGRMNO'] ?? '';

        Bankcard::sign($param);

        return $this->format('签约成功', 1);
    }

    /**
     * 退款
     */
    public function refund()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::REFUND_BIND,
            'info' => $this->param
        ]);

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'REFUND' => [
                'ORGBATCHID' => $this->param['orgbatchid'], //原req_sn号
                'ORGBATCHSN' => $this->param['orgbatchsn'], //原交易序号,单笔实时交易时填0
                'AMOUNT' => $this->param['amount'],
            ]
        ];

        $result = $this->api->setParam($param)->refund();

        $is_success = $this->parse($result);

        if ($is_success !== true) {
            return $this->format($is_success);
        }

        $code = $result["AIPG"]['TRANSRET']['RET_CODE'] ?? false;

        if ($code !== '0000') {
            return $this->format($result['AIPG']['TRANSRET']['ERR_MSG'] ?? '');
        }

        return $this->format('退款成功', 1);
    }

    /**
     * 解约银行卡
     */
    public function unbind()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::UNBIND,
            'info' => $this->param
        ]);

        $agrmno = $this->param['agrmno'];

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'FAGRCNL' => [
                'AGRMNO' => $agrmno
            ]
        ];

        $result = $this->api->setParam($param)->unbind();

        $is_success = $this->parse($result);

        if ($is_success !== true) {
            return $this->format($is_success);
        }

        $code = $result["AIPG"]['FAGRCRET']['RET_CODE'] ?? false;

        if ($code !== '0000') {
            return $this->format($result['AIPG']['FAGRCRET']['ERR_MSG'] ?? '');
        }

        Bankcard::unSign($agrmno);

        return $this->format('解约成功', 1);
    }

    /**
     * 交易结果查询
     */
    public function search()
    {
        $sn = $this->makeSn();

        Tonglian::create([
            'req_sn' => $sn,
            'type' => Tonglian::SEARCH,
            'info' => $this->param
        ]);

        $param = [
            'INFO' => [
                'REQ_SN' => $sn
            ],
            'QTRANSREQ' => [
                'QUERY_SN' => $this->param['query_sn']
            ]
        ];

        $result = $this->api->setParam($param)->search();

        $is_success = $this->parse($result);

        if ($is_success !== true) {
            return $this->format($is_success);
        }

        return $this->format('查询成功', 1, $result['AIPG']['QTRANSRSP']);
    }

    /**
     * 解析
     */
    protected function parse($param)
    {
        $code = $param['AIPG']['INFO']['RET_CODE'] ?? false;
        if ($code !== '0000') {
            return $param['AIPG']['INFO']['ERR_MSG'] ?? '';
        }

        /*$code = $param["AIPG"]['FAGRARET']['RET_CODE'] ?? false;
        if ($code !== '0000') {
            return $param['AIPG']['INFO']['ERR_MSG'] ?? '';
        }*/

        return true;
    }

    /**
     * 格式化返回数据
     * @param       $msg
     * @param int   $code
     * @param array $data
     *
     * @return array
     */
    protected function format($msg, $code = 0, $data = [])
    {
        $result = [
            'msg' => $msg,
            'code' => $code,
            'data' => $data
        ];

        return $result;
    }
}
