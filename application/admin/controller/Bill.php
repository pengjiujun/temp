<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Bill as BillModel;
use think\db\Query;

/**
 * 还款
 * Class Bill
 *
 * @package \app\admin\controller
 */
class Bill extends AdminBase
{
    /**
     * 还款管理
     * @param \app\common\model\Bill $bill
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(BillModel $bill)
    {
        $data = $this->request->param();

        $lists = $bill->hasWhere('user', function (Query $query) use ($data) {
            if ($data['keyword'] ?? '') {
                $query->whereLike('username', "%{$data['keyword']}%");
            }
            if ($data['mobile'] ?? '') {
                $query->whereLike('mobile', "%{$data['mobile']}%");
            }
        })->with('user')
        ->withSearch(['sort', 'create_time'], [
            'create_time' => 'repay_time',
            'start_time' => $data['start_time'] ?? '',
            'end_time' => $data['end_time'] ?? ''
        ])->where('bill.status', $bill::YES)
        ->paginate($this->size, false, array_query($data));

        $this->total($lists);
        $this->assign('lists', $lists);

        return $this->fetch();
    }


    /**
     * @param $lists \think\Collection|\think\Paginator
     */
    protected function total($lists)
    {
        //用户总数
        $total_user = count($lists->column('id', 'uid'));

        //订单总数
        $total_order = count($lists->column('id', 'order_id'));

        //还款总额
        $total_price = sprintf('%0.2f', round(array_sum($lists->column('price')), 2));

        //总笔数
        $total = $lists->count();

        $this->assign([
            'total_user' => $total_user,
            'total_order' => $total_order,
            'total_price' => $total_price,
            'total' => $total
        ]);
    }
}
