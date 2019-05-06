<?php
namespace app\admin\controller;

use app\common\model\Ibec;
use app\common\model\InsuranceCompany as CompanyModel;
use app\common\controller\AdminBase;

/**
 * 保险公司管理
 * Class InsuranceCompany
 * @package app\admin\controller
 */
class Company extends AdminBase
{
    /**
     * 保险公司管理
     * @param \app\common\model\InsuranceCompany $company
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(CompanyModel $company)
    {
        $data = $this->request->param();

        $lists = $company->withSearch(['keyword', 'sort'], [
            'custom' => 'name',
            'keyword' => $data['keyword'] ?? ''
        ])->where('admin_id', $this->app->session->get('admin_id'))
            ->paginate($this->size, false, array_query($data));

        $this->assign('lists', $lists);
        $this->assign('status',CompanyModel::$status);

        return $this->fetch();
    }

    /**
     * 添加保险公司
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存保险公司
     * @param \app\common\model\InsuranceCompany $company
     */
    public function save(CompanyModel $company)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $company->allowField(true)->save($data);

            $this->response($result, $company);
        }
    }

    /**
     * 编辑保险公司
     * @param \app\common\model\InsuranceCompany $company
     *
     * @return mixed
     */
    public function edit(CompanyModel $company)
    {
        $this->assign('info', $company);

        return $this->fetch('add');
    }

    /**
     * 更新保险公司
     * @param \app\common\model\InsuranceCompany $company
     */
    public function update(CompanyModel $company)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $company->allowField(true)->save($data);

            $this->response($result, $company);
        }
    }

    /**
     * 删除保险公司
     * @param \app\common\model\InsuranceCompany $company
     *
     * @throws \Exception
     */
    public function delete(CompanyModel $company)
    {
        $result = $company->delete();

        $this->response($result, $company);
    }

    /**
     * 添加经济公司
     * @param \app\common\model\InsuranceCompany $company
     *
     * @return \think\response\View
     */
    public function ibec(CompanyModel $company)
    {
        $lists = $company->ibec;

        if ($this->request->isPost()) {
            $data = $this->request->param();

            unset($data['id']);

            $result = $company->ibec()->save($data);

            $this->response($result, $company);
        }

        $this->assign('info', $company);
        $this->assign('lists', $lists);
        return view('ibec');
    }

    /**
     * 删除经济公司
     * @param \app\common\model\Ibec $ibec
     *
     * @throws \Exception
     */
    public function deleteIbec(Ibec $ibec)
    {
        $result = $ibec->delete();

        $this->response($result, $ibec);
    }
}