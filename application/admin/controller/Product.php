<?php
namespace app\admin\controller;

use app\common\model\Product as ProductModel;
use app\common\controller\AdminBase;

/**
 * 保险产品管理
 * Class Product
 * @package app\admin\controller
 */
class Product extends AdminBase
{
    /**
     * 保险产品管理
     * @param \app\common\model\Product $product
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(ProductModel $product)
    {
        $data = $this->request->param();

        $lists = $product->withSearch(['keyword', 'sort'], [
            'custom' => 'name',
            'keyword' => $data['keyword'] ?? ''
        ])->paginate(3, false, array_query($data));

        $this->assign('lists', $lists);

        return $this->fetch();
    }

    /**
     * 公用渲染
     */
    protected function assignCommon()
    {
        $this->assign('charge_list', ProductModel::getCharge());
    }


    /**
     * 添加保险产品
     * @return mixed
     */
    public function add()
    {
        $this->assignCommon();
        return $this->fetch();
    }

    /**
     * 保存保险产品
     * @param \app\common\model\Product $product
     */
    public function save(ProductModel $product)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $product->allowField(true)->save($data);

            $this->response($result, $product);
        }
    }

    /**
     * 编辑保险产品
     * @param \app\common\model\Product $product
     *
     * @return mixed
     */
    public function edit(ProductModel $product)
    {
        $this->assign('info', $product);
        $this->assignCommon();

        return $this->fetch('add');
    }

    /**
     * 更新保险产品
     * @param \app\common\model\Product $product
     */
    public function update(ProductModel $product)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $product->allowField(true)->save($data);

            $this->response($result, $product);
        }
    }

    /**
     * 删除保险产品
     * @param \app\common\model\Product $product
     *
     * @throws \Exception
     */
    public function delete(ProductModel $product)
    {
        $result = $product->delete();

        $this->response($result, $product);
    }
}