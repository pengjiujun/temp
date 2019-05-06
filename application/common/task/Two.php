<?php

namespace app\common\task;

use app\common\model\Bankcard;
use app\common\model\Bill;
use app\common\model\PayFail;
use think\helper\Time;
use yunwuxin\cron\Task;

/**
 * 自动还款
 * Class Crontab
 *
 * @package \app\api\task
 */
class Two extends Task
{
    protected function configure()
    {
        //每天13点执行
        $this->at(13);
    }

    public function execute()
    {
        /**
         * @var \app\common\service\PayService $pay
         */
        $pay = app()->pay;

        /*
         * 查出需要自动扣款的数据
         */
        $time = Time::today();
        $lists = Bill::where('status', Bill::NO)
            ->whereTime('repay_time', 'between', $time)
            ->select();

        //存在数据执行扣款
        if (!$lists->isEmpty()) {
            $uids = $lists->column('uid', 'uid');
            //签约银行卡数据
            $bankcards = Bankcard::field('*')
                ->whereIn('uid', $uids)
                ->where('is_sign', 1)
                ->order(['is_master'=>'asc', 'update_time'=>'asc'])
                ->column('agrmno,name', 'uid');

            //循环支付
            foreach ($lists as $item) {
                $pay_fail = [
                    'bill_id' => $item['uid'],
                    'uid' => $item['uid'],
                    'repay_time' =>  $item->getData('repay_time'),
                    'status' => PayFail::TWO,
                    'price' => $item['price']
                ];

                //存在签约银行卡
                if (isset($bankcards[$item['uid']])) {
                    $pay = new $pay([
                        'account_name' => $bankcards[$item['uid']]['name'],
                        'agrmno' => $bankcards[$item['uid']]['agrmno'],
                        'amount' => $item['price'],
                    ]);

                    $result = $pay->signPay();

                    $code = $result['code'] ?? 0;

                    //支付失败
                    if (empty($code)) {
                        array_push($pay_fail, ['remark' => $result['msg'] ?? '']);

                        PayFail::create($pay_fail);
                    }

                    //支付成功
                    $item->status = Bill::YES;
                    $item->real_time = time();
                    $item->save();

                    //不存在签约银行卡
                } else {
                    array_push($pay_fail, ['remark' => '不存在签约银行卡']);

                    PayFail::create($pay_fail);
                }
            }
        }
    }

}