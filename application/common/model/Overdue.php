<?php

namespace app\common\model;

use think\db\Query;

/**
 * 逾期
 * Class Overdue
 *
 * @package \app\common\model
 */
class Overdue extends Base
{
    protected $dateFormat = 'Y-m-d';

    protected $type = [
        'real_time' => 'timestamp',
        'repay_time' => 'timestamp'
    ];

    /*
     * 状态
     */
    const NO = 1;
    const YES = 2;
    const STATUS = [
        self::NO => '逾期未还',
        self::YES => '逾期已还'
    ];

    /**
     * 查询
     * @param $data
     *
     * @return \think\db\Query
     */
    public function getLists($data)
    {
        $query = $this->hasWhere('user', function (Query $query) use ($data) {
            if ($data['keyword'] ?? '') {
                $query->whereLike('username', "{$data['keyword']}");
            }
            if ($data['mobile'] ?? '') {
                $query->whereLike('mobile', "%{$data['mobile']}%");
            }
        })->with('user')
            ->withSearch(['sort', 'create_time'], [
                'create_time' => 'repay_time',
                'start_time' => $data['start_time'] ?? '',
                'end_time' => $data['end_time'] ?? ''
            ]);

        return $query;
    }

    /**
     * 绑定用户
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('User', 'uid');
    }

    /**
     * 绑定订单
     * @return \think\model\relation\BelongsTo
     */
    public function orders()
    {
        return $this->belongsTo('Order', 'order_id');
    }
}