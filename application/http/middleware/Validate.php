<?php

namespace app\http\middleware;

/**
 * 验证中间件
 * Class Validate
 *
 * @package app\http\middleware
 */
class Validate
{
    public function handle($request, \Closure $next)
    {
        //自动验证控制器对应的验证器
        app(\app\common\lib\Validate::class);

        return $next($request);
    }
}
