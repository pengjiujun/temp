<?php

namespace app\api\validate;

use think\Validate;

/**
 * Class Base
 *
 * @package \app\admin\validate
 */
class Base extends Validate
{
    protected $scene = [
        'save' => [],
        'update' => []
    ];
}