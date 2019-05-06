<?php

namespace app\common\task;

use app\common\model\Bill;
use Carbon\Carbon;
use yunwuxin\cron\Task;
use app\common\model\Overdue as OverdueModel;

/**
 * 还款逾期定时任务
 * Class Crontab
 *
 * @package \app\api\task
 */
class Overdue extends Task
{
    protected function configure()
    {
        //每天0:0执行
        $this->daily();
    }

    public function execute()
    {
        //当前时间
        $now = Carbon::now()->subMinutes(3)->timestamp;

        $where = [];

        array_push($where, ['status','eq',Bill::NO]);
        array_push($where, ['repay_time','< time',$now]);

        $lists = Bill::where($where)->select();

        if (!$lists->isEmpty()) {
            $overdue = [];
            foreach ($lists as $item) {
                array_push($overdue, [
                    'order_id' => $item['order_id'],
                    'bill_id' => $item['id'],
                    'uid' => $item['uid'],
                    'price' => $item['price'],
                    'status' => OverdueModel::NO,
                    'repay_time' => $item->getData('repay_time')
                ]);
            }
            //批量写入逾期记录
            OverdueModel::insertAll($overdue);
            //修改账单为逾期
            Bill::update(['status' => Bill::OVERDUE], $where);
        }
    }

}