<?php

return [
    'tasks' => [
        \app\common\task\Overdue::class,        //逾期写入
        \app\common\task\One::class,            //第一次自动扣款
        \app\common\task\Two::class,            //第二次自动扣款
        \app\common\task\Three::class,          //第三次自动扣款
    ]
];