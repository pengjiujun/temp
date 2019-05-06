<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Bankcard;
use app\common\model\Bill;
use app\common\model\Order;

/**
 * 用户
 * Class User
 *
 * @package \app\api\controller
 */
class User extends IndexBase
{
    /**
     * @title 个人信息@
     */
    public function index()
    {
        $user = $this->getUser();

        $bill = $user->bill()->where('status', Bill::NO)->order('repay_time', 'asc')->findOrEmpty();

        $this->assign('info', $user);
        $this->assign('bill', $bill);

        return view();
    }

    /**
     * @title 银行卡信息@
     *
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bankcard()
    {
        $user = $this->getUser();

        $lists = $user->bankcard;

        $this->assign('lists', $lists);

        return view();
    }

    /**
     * @title 账单信息@
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bill()
    {
        $user = $this->getUser();

        /**
         * @var \think\Collection $lists
         */
        $lists = $user->bill;
        $total = 0;

        if (!$lists->isEmpty()) {
            $total = sprintf('%0.2f', round(array_reduce($lists->column(null, 'id'), function ($old, $new) {
                if (intval($new['status']) === Bill::NO) {
                    return $old + $new['price'];
                }
                return $old;
            }, 0), 2));
        }

        $this->assign('lists', $lists);
        $this->assign('total', $total);

        return view();
    }

    /**
     * @title 分期记录@
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function orders()
    {
        $user = $this->getUser();

        $insurd = $user->insured;

        if ($insurd) {
            if ($this->request->isAjax()) {
                $status = $this->request->param('status/d', Order::STATUS_APPLY);
                $lists = $insurd->orders()->where('status', $status)->select();

                $this->result('', 1, $lists);
            } else {
                $lists = $insurd->orders()->where('status', Order::STATUS_APPLY)->select();
            }
        } else {
            $lists = [];
        }

        $this->assign('lists', $lists);

        return view();
    }

    /**
     * @title 银行卡验证@
     * @return \think\response\View
     */
    public function bankcardVerify()
    {
        $this->assign([
            'bank_lists' => Bankcard::BANK,
            'type_lists' => Bankcard::TYPE,
            'id_type_lists' => Bankcard::ID_TYPE
        ]);

        $this->assign('order_id', $this->request->param('order_id', 0));

        return view('bankcard_verify');
    }

    /**
     * 退出
     */
    public function logout()
    {
        $this->setUser();

        $this->app->cache->rm($this->token);

        $this->redirect('/');
    }
}
