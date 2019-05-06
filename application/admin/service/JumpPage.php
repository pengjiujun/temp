<?php

namespace app\admin\service;

use think\paginator\driver\Bootstrap;

/**
 * Class JumpPage
 *
 * @package \app\admin\service
 */
class JumpPage extends Bootstrap
{
    /**
     * 覆盖父类的渲染方法
     * @return mixed|string
     */
    public function render()
    {
//        var_dump($this);

        if ($this->hasPages()) {
            if ($this->simple) {
                return sprintf(
                    '<ul class="pager">%s %s</ul>',
                    $this->getPreviousButton(),
                    $this->getNextButton()
                );
            } else {
//                return sprintf(
//                    '<ul class="pagination">%s %s %s %s %s %s</ul>',
//                    $this->getStartButton(),
//                    $this->getPreviousButton(),
//                    $this->getLinks(),
//                    $this->getNextButton(),
//                    $this->getEndButton(),
//                    $this->getJumpPage(preg_replace('#[?|&]page=1#', '', urldecode($this->url(1))))
//                );

                return '<div id="layuiPage"></div><script>var current_page = '
                    .$this->currentPage.';var total_page = '.$this->lastPage.';</script>';
            }
        }
    }

    /**
     * 增加跳转页面
     * @param $url
     *
     * @return string
     */
    protected function getJumpPage($url)
    {
        return '<input type="text" value="" id="jump_input"/><button type="button" data-url="'.$url.'" id="jump">跳转</button>';
    }

    /**
     * 增加跳转页面
     * @param $url
     *
     * @return string
     */
    protected function getStartButton($url = '')
    {
        return '<button type="button" data-url="'.$url.'" id="iii">首页</button>';
    }

    /**
     * 增加跳转页面
     * @param $url
     *
     * @return string
     */
    protected function getEndButton($url = '')
    {
        return '<button type="button" data-url="'.$url.'" id="jjj">尾页</button>';
    }


}
