<?php

namespace app\common\model;

use think\Model;

/**
 * Class Base
 *
 * @package \app\common\model
 */
class Base extends Model
{
    //时间字段设置为int
    protected $autoWriteTimestamp = 'int';

    /**
     * 关键字查询
     * @param $query \think\db\Query
     * @param $value
     * @param $data
     */
    public function searchKeywordAttr($query, $value, $data)
    {
        //查询字段
        $field = $data['custom'] ?? 'keyword';

        $query->whereLike($field, "%{$value}%");
    }

    /**
     * 排序
     * @param $query \think\db\Query
     * @param $value
     * @param $data
     */
    public function searchSortAttr($query, $value, $data)
    {
        $query->order($value ?: ['create_time'=>'desc']);
    }

    /**
     * 时间查询
     * @param $query \think\db\Query
     * @param $value
     * @param $data
     */
    public function searchCreateTimeAttr($query, $value, $data)
    {
        //查询字段
        $field = $data['create_time'] ?? 'create_time';

        $start_time = $data['start_time'] ?? null;
        $end_time = $data['end_time'] ?? null;

        if ($start_time && $end_time) {
            $query->whereBetweenTime($field, $start_time, $end_time);
        } elseif ($start_time) {
            //开始时间之后的
            $query->whereTime($field, '>=', $start_time);
        } elseif ($end_time) {
            //结束时间之前的
            $query->whereTime($field, '<=' . $end_time);
        }
    }
}