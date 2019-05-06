<?php

namespace app\common\controller;

use app\common\model\User;
use think\Controller;
use think\exception\HttpResponseException;
use think\Response;

/**
 * Class ApiBase
 *
 * @package \app\common\controller
 */
class IndexBase extends Controller
{
    protected $page = 1;
    protected $size = 10;

    protected $token = '';

    private $user = '';

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub

        //移除HTML标签
        $this->request->filter('strip_tags');

        // token
        $this->token = $this->request
            ->server('HTTP_TOKEN', $this->request->request('token', app()->cookie->get('token')));

        $this->user = $this->app->cache->get($this->token);

        //存入session
        $this->app->session->set('user', $this->user);

        if (!$this->token || !$this->user) {
            $this->redirect(url('/login'));
        }
        /*
         * 加载分页
         */
        $this->page = $this->request->param('page', 1);
        $this->size = $this->request->param('size', 10);

        $this->assign('user', $this->getUserInfo($this->user));
    }

    /**
     * 返回封装后的API数据到客户端
     * @access protected
     * @param  mixed     $data 要返回的数据
     * @param  integer   $code 返回的code
     * @param  mixed     $msg 提示信息
     * @param  string    $type 返回数据格式
     * @param  array     $header 发送的Header信息
     * @return void
     */
    protected function result($msg, $code = 0, $data = null, $type = '', array $header = [])
    {
        if (is_array($msg)) {
            $result = $msg;
            $result['time'] = time();
        } else {
            $result = [
                'code' => $code,
                'msg'  => $msg,
                'time' => time(),
                'data' => $data,
            ];
        }

        $type     = 'json';

        $response = Response::create($result, $type)->header($header);

        throw new HttpResponseException($response);
    }

    /**
     * 获取用户对象
     * @return array|\app\common\model\User
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getUser()
    {
        return User::where('mobile', $this->getUserInfo()['mobile'])->findOrFail();
    }

    /**
     * 获取用户信息
     */
    public function getUserInfo()
    {
        return json_decode($this->user, true);
    }

    /**
     * 更新用户信息
     */
    public function setUser($user = [])
    {
        $this->app->cache->set($this->token, json_encode($user));

        $this->user = $this->app->cache->get($this->token);

        $this->app->session->set('user', $this->user);
    }
}
