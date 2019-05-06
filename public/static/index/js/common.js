(function ($) {
    $.init({
        statusBarBackground: '#f7f7f7'
    });
}(mui, document));

var jq = jQuery.noConflict();
var second = -1;   //倒计时秒数

//点击“获取验证码”
jq('#verify').on('tap',function () {
    let mobile = jq('#phone').val();

    if (second >= 0) {
        return;
    }

    //请求验证码
    jq.post('/captcha', {mobile: mobile}, function (res) {
        if (res.code) {
            jq('#verify').css({'color': "#cccccc", "border-color": "#cccccc"});
            second = 60;
            jq('#verify').text(second + 's后重新获取');
            //开始计时
            let setInt = setInterval(() => {
                if (second == 0) {
                    clearInterval(setInt);
                    second = -1;
                    jq('#verify').css({'color': "#007aff", "border-color": "#007aff"});
                    jq('#verify').text('获取验证码');
                    return;
                }
                second--;
                jq('#verify').text(second + 's后重新获取');
            }, 1000);
            // mui.msg(res.msg);
        }
        mui.alert(res.msg);
    });

});
