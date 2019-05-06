<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Overdue as OverdueModel;

/**
 * 逾期
 * Class Overdue
 *
 * @package \app\admin\controller
 */
class Overdue extends AdminBase
{
    /**
     * 逾期未还管理
     * @param \app\common\model\Overdue $overdue
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function indexNo(OverdueModel $overdue)
    {
        $data = $this->request->param();

        $lists = $overdue->getLists($data)
            ->where('Overdue.status', $overdue::NO)
            ->paginate($this->size, false, array_query($data));

        $this->assign('lists', $lists);

        $this->assign('title', '逾期未还管理');
        return $this->fetch('index');
    }

    /**
     * 逾期已还管理
     * @param \app\common\model\Overdue $overdue
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function indexYes(OverdueModel $overdue)
    {
        $data = $this->request->param();

        $lists = $overdue->getLists($data)
            ->where('Overdue.status', $overdue::YES)
            ->paginate($this->size, false, array_query($data));

        $this->assign('lists', $lists);

        $this->assign('title', '逾期已还管理');
        return $this->fetch('index');
    }
}
