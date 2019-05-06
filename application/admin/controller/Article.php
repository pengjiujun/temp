<?php
namespace app\admin\controller;

use app\common\model\Article as ArticleModel;
use app\common\controller\AdminBase;

/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class Article extends AdminBase
{
    /**
     * 文章管理
     * @param \app\common\model\Article $article
     *
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index(ArticleModel $article)
    {
        $data = $this->request->param();

        $lists = $article->withSearch(['keyword', 'sort'], [
            'custom' => 'title|introduction',
            'keyword' => $data['keyword'] ?? ''
        ])->paginate($this->size, false, array_query($data));

        $this->assign('lists', $lists);

        return $this->fetch();
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存文章
     * @param \app\common\model\Article $article
     */
    public function save(ArticleModel $article)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $article->allowField(true)->save($data);

            $this->response($result, $article);
        }
    }

    /**
     * 编辑文章
     * @param \app\common\model\Article $article
     *
     * @return mixed
     */
    public function edit(ArticleModel $article)
    {
        $this->assign('info', $article);

        return $this->fetch('add');
    }

    /**
     * 更新文章
     * @param \app\common\model\Article $article
     */
    public function update(ArticleModel $article)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $result = $article->allowField(true)->save($data);

            $this->response($result, $article);
        }
    }

    /**
     * 删除文章
     * @param \app\common\model\Article $article
     *
     * @throws \Exception
     */
    public function delete(ArticleModel $article)
    {
        $result = $article->delete();

        $this->response($result, $article);
    }
}