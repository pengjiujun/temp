<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\System as SystemModel;

/**
 * 系统配置
 * Class System
 * @package app\admin\controller
 */
class System extends AdminBase
{
    /**
     * 网站配置
     * @param \app\common\model\System $system
     *
     * @return mixed
     */
    public function siteConfig(SystemModel $system)
    {
        $site = $system->getSite();
        return $this->fetch('site_config', ['site_config' => $site['value'],'id'=>$site['id']]);
    }

    /**
     * 更新网站配置
     * @param \app\common\model\System $system
     */
    public function updateSiteConfig(SystemModel $system)
    {
        if ($this->request->isPost()) {
            $site_config = $this->request->post('site_config/a');
            $data = [
                'name' => $system::SITE,
                'value' => $site_config
            ];

            $result = $system->save($data);

            $this->response($result, $system);
        }
    }

    /**
     * 清除缓存
     */
    public function clear()
    {
        if (delete_dir_file($this->app->getRuntimePath().'cache')
            || delete_dir_file($this->app->getRuntimePath().'temp')) {
            $this->success('清除缓存成功');
        } else {
            $this->error('清除缓存失败');
        }
    }

    /**
     * @param \app\common\model\System $system
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(SystemModel $system)
    {
        $lists = $system->where('name', 'neq', $system::SITE)->paginate($this->size);

        $this->assign('lists', $lists);

        return $this->fetch();
    }

    /**
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * @param \app\common\model\System $system
     */
    public function save(SystemModel $system)
    {
        $data = $this->request->post();

        $result = $system->allowField(true)->save($data);

        $this->response($result, $system);
    }

    /**
     * @param \app\common\model\System $system
     *
     * @return mixed
     */
    public function edit(SystemModel $system)
    {
        $this->assign('info', $system);

        return $this->fetch('add');
    }

    /**
     * @param \app\common\model\System $system
     */
    public function update(SystemModel $system)
    {
        $data = $this->request->post();

        $result = $system->allowField(true)->save($data);

        $this->response($result, $system);
    }

    /**
     * @param \app\common\model\System $system
     *
     * @throws \Exception
     */
    public function delete(SystemModel $system)
    {
        $result = $system->delete();

        $this->response($result, $system);
    }
}