<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\PayFail;
use think\db\Query;

/**
 * 还款
 * Class Record
 *
 * @package \app\admin\controller
 */
class Record extends AdminBase
{
    /**
     * 还款失败记录
     * @param \app\common\model\PayFail $pay
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function billFail(PayFail $pay)
    {
        $data = $this->request->param();

        $lists = $pay->hasWhere('user', function (Query $query) use ($data) {
            if ($data['keyword'] ?? '') {
                $query->whereLike('username', "%{$data['keyword']}%");
            }
            if ($data['mobile'] ?? '') {
                $query->whereLike('mobile', "%{$data['mobile']}%");
            }
        })->with(['user'])
        ->withSearch(['sort', 'create_time'], [
            'start_time' => $data['start_time'] ?? '',
            'end_time' => $data['end_time'] ?? ''
        ])->paginate($this->size, false, array_query($data));

        $this->assign('lists', $lists);

        return $this->fetch('bill_fail');
    }
}
