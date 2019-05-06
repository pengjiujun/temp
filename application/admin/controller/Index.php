<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Insured;
use Carbon\Carbon;
use think\Db;
use think\helper\Time;

/**
 * 后台首页
 * Class Index
 * @package app\admin\controller
 */
class Index extends AdminBase
{
    /**
     * 首页
     */
    public function index()
    {
        $config = \app\common\model\System::getHome();

        //未支付首付
        $down_payment = \app\common\model\Bill::where('status', \app\common\model\Bill::NO)
            ->where('stage', 1)
            ->count('price');
        //已逾期
        $overdue = \app\common\model\Overdue::where('status', \app\common\model\Overdue::NO)
            ->count('price');
        //待平台审核
        $audit = \app\common\model\Order::where('status', \app\common\model\Order::STATUS_APPLY)
            ->count('id');
        //待注册
        $register = Insured::column('id', 'mobile');
        $user = \app\common\model\User::column('id', 'mobile');
        $diff = count(array_diff_key($register, $user));

        //今日数据统计
        $yesterday = date('j', strtotime('-1 day'));
        $todayCount = app('order')->getOrderCountByDay();
        $yesterdayCount = app('order')->getOrderCountByDay($yesterday);
        $todayAmount = app('order')->getOrderAmountByDay();
        $yesterdayAmount = app('order')->getOrderAmountByDay($yesterday);
        $this->assign('todayCount', $todayCount);
        $this->assign('yesterdayCount', $yesterdayCount);
        $this->assign('todayAmount', $todayAmount);
        $this->assign('yesterdayAmount', $yesterdayAmount);

        $this->assign(compact('down_payment', 'overdue', 'audit', 'diff'));

        $this->assign('lists', $config);
//        $this->assign('total', count($config));

        return $this->fetch('index');
    }

    /**
     * 异步获取图表数据
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getCharts()
    {
        $result = [
            'month' => [],  //月销售数据
            'order' => [],  //订单周数据
            'price' => [],  //保费周数据
        ];

        $now = Carbon::now();
        $day = $now->day;
        $now_time = $now->timestamp;
        //本周开始时间
        $weekday_time = $now->subDays(7)->timestamp;
        //本月开始结束时间
        $month_time = Time::month();

        $order = \app\common\model\Order::whereTime('create_time', $month_time)->select();
        $result['month'] = $this->getData($day, $order, [
            'title' => '月数据对比',
            'legend' => '保费',
            'type' => 'bar'
        ], 1);

        $order = \app\common\model\Order::whereTime('create_time', [$weekday_time, $now_time])->select();

        $result['order'] = $this->getData($day, $order, [
            'title' => '一周订单数量',
            'legend' => '销量',
            'type' => 'line'
        ], $day - 7, 'count');

        $result['price'] = $this->getData($day, $order, [
            'title' => '一周保费数量',
            'legend' => '金额',
            'type' => 'bar'
        ], $day-7);

        $this->result($result, 1);
    }

    /**
     * 图表数据计算
     * @param        $day
     * @param        $order
     * @param        $option
     * @param        $i
     * @param string $type
     *
     * @return array
     */
    private function getData($day, $order, $option, $i, $type = 'sum')
    {
        $data = [];
        for (; $i <= $day; $i++) {
            $data[$i] = 0;
        }
        foreach ($order as $item) {
            $time = Carbon::createFromTimestamp($item->getData('create_time'))->day;

            switch ($type) {
                case 'sum':
                    $data[$time] = round($item['premium']+$data[$time], 2);
                    break;
                case 'count':
                    $data[$time] += 1;
                    break;
                default:
                    $data[$time] = round($item['premium']+$data[$time], 2);
                    break;
            }
        }

        $color_map = ['#D53d22', '#ca23b0', '#47bd65','#bdb71c','#bd1e30','#71bd2a','#0a66bd'];
        $color_rand = array_rand($color_map, 3);
        $color = [];

        foreach ($color_rand as $key => $value) {
            array_push($color, $color_map[$value]);
        }

        $result = [
            'color' => $color,
            'title' => $option['title'],
            'legend' => [$option['legend']],
            'x' => array_keys($data),
            'series' => [
                [
                    'name' => $option['legend'],
                    'type' => $option['type'],
                    'data' => array_values($data)
                ]
            ]
        ];

        return $result;
    }
}
