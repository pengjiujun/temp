let charts = function (element, data) {
    let chart = echarts.init(document.getElementById(element));
    let option = {
        // 全局调色盘。
        color: data.color,

        title: {
            text: data.title
        },
        tooltip: {},
        legend: {
            data: data.legend
        },
        xAxis: {
            data: data.x
        },
        yAxis: {},
        series: data.series
    };
    chart.setOption(option);
};