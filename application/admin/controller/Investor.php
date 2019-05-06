<?php
/**
 * Created by PhpStorm.
 * User: jack
 * Date: 2019/1/29
 * Time: 11:46 PM
 */

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Investor as InvestorModel;
use app\common\model\PolicyHolder;

class Investor extends AdminBase
{

    public function index(InvestorModel $investor)
    {
        $data = $this->request->param();

        $lists = $investor->withSearch(['keyword', 'sort'], [
            'custom' => 'investors',
            'keyword' => $data['keyword'] ?? ''
        ])->paginate($this->size, false, array_query($data));

        $this->assign('lists', $lists);

        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function save(InvestorModel $investor)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $investor->allowField(true)->save($data);

            $this->response($result, $investor);
        }
    }

    public function edit($id)
    {
        $investor = InvestorModel::get($id);
        $this->assign('investor', $investor);
        return $this->fetch();
    }

    public function update(InvestorModel $investor)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $investor->allowField(true)->save($data, ['id'=>$data['id']]);

            $this->response($result, $investor);
        }
    }

    public function delete(InvestorModel $investor)
    {
        $result = $investor->delete();

        $this->response($result, $investor);
    }

    public function policy($id)
    {
        $investor = InvestorModel::get($id);
        if(empty($investor)){
            return $this->error('资方信息不存在');
        }
        $this->assign('investor', $investor);
        return $this->fetch();
    }

    public function savepolicy(PolicyHolder $holder)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $holder->allowField(true)->save($data);

            $this->response($result, $holder);
        }
    }

    public function policylist(PolicyHolder $holder)
    {
        $data = $this->request->param();

        $lists = $holder->withSearch(['keyword', 'sort'], [
            'custom' => 'investor_id',
            'keyword' => $data['id'] ?? ''
        ]);

        $this->assign('lists', $lists);

        return $this->fetch();
    }

}