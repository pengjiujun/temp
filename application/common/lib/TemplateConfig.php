<?php

namespace app\common\lib;

use app\common\model\System;
use think\facade\Cache;
use think\facade\View;

/**
 * 模板全局配置
 * Class TemplateConfig
 *
 * @package app\common\lib
 */
class TemplateConfig
{
    protected $defaultAssign    =   [];

    public function __construct()
    {
        $this->getConfig();
        $this->getActionConfig();
        View::share($this->defaultAssign);
    }

    /**
     * 获取应用基础配置，如网站名称、静态文件目录等
     * @return $this
     */
    protected function getConfig()
    {
        $config = Cache::remember('app_config', function () {
            return System::defaultConfig() ?: [];
        }, 0);
        $configAssign   =   [];
        foreach ($config as $key => $value) {
            $configAssign['app_config'][$key]    =   $value;
        }
        $this->defaultAssign    =   array_merge($this->defaultAssign, $configAssign);
        return $this;
    }

    /**
     * 渲染方法标题
     */
    protected function getActionConfig()
    {
        $tag = '@title';
        $request = app()->request;
        $title = 'app';

        try {
            //当前类
            $class = new \ReflectionClass("app\\{$request->module()}\\controller\\{$request->controller()}");
            //当前方法
            $method = $class->getMethod($request->action());
            //注释
            $comment = $method->getDocComment();

            if (false !== strpos($comment, $tag)) {
                $comment = substr($comment, 3, -2);
                $comment = explode('@', substr(strstr(trim($comment), $tag), 1));
                $comment = array_shift($comment);
                $title = trim(str_replace(substr($tag, 1), '', $comment));
            }
        } catch (\ReflectionException $reflectionException) {
        }

        $this->defaultAssign['title'] = $title;
    }
}
