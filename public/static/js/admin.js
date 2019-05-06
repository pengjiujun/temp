/**
 * 后台JS主入口
 */

var layer = layui.layer,
    element = layui.element(),
    laydate = layui.laydate,
    form = layui.form();

/**
 * AJAX全局设置
 */
$.ajaxSetup({
    type: "post",
    dataType: "json"
});

/**
 * 后台侧边菜单选中状态
 */
$('.layui-nav-item').find('a').removeClass('layui-this');
// $('.layui-nav-item').find('a').find('.layui-icon-left').css('transform','none');
$('.layui-nav-tree').find('a[href*="' + GV.current_controller +'"]').parent().addClass('layui-this').parents('.layui-nav-item').addClass('layui-nav-itemed');
// $('.layui-nav-tree').find('a[href*="' + GV.current_controller +'"]').parent().find('.layui-icon-left').css('transform','rotate(-90deg)');
// console.log($('.layui-nav-tree').find('a[href*="' + GV.current_controller +'"]').parent())
/**
 * 通用单图上传
 */
layui.upload({
    url: "/index.php/api/upload/upload",
    type: 'image',
    ext: 'jpg|png|gif|bmp|jpeg',
    success: function (data,input) {
        if (data.error === 0) {
            $(input).parent().parent().prev().val(data.url);
            $(input).parent().parent().next().show();
            $(input).parent().parent().next().attr('src', data.url);
            // document.getElementById('thumb').value = data.url;
            if($(input).parent().parent().prev().attr('id') == 'thumb-front'){
                $(input).parent().parent().prev().trigger('input:card_changed', data.url)
            }
            if($(input).parent().parent().prev().attr('id') == 'thumb-original'){
                $(input).parent().parent().prev().trigger('input:license_changed', data.url)
            }
            if($(input).parent().parent().prev().attr('id') == 'thumb-license'){
                $(input).parent().parent().prev().trigger('input:enterprise_license_changed', data.url)
            }
        } else {
            layer.msg(data.message);
        }
    }
});

/**
 * 通用日期时间选择
 */
$('.datetime').on('click', function () {
    var minDate = $(this).attr('laydate-min') ? $(this).attr('laydate-min') : '',
        maxDate = $(this).attr('laydate-max') ? $(this).attr('laydate-max') : '',
        formatDate = $(this).attr('laydate-format') ? $(this).attr('laydate-format') : 'YYYY-MM-DD hh:mm:ss';
    laydate({
        elem: this,
        istime: true,
        format: formatDate,
        min: minDate,
        max: maxDate,
        choose: function (dates) {
            if($(this.elem).attr('name') == 'policy_expiry'){
                $(this.elem).trigger('input:policy_expiry', dates)
            }
        }
    })
});

/**
 * 通用日期选择
 */
$('.date').on('click', function () {
    laydate({
        elem: this,
        istime: false,
        format: 'YYYY-MM-DD'
    })
});

/**
 * 通用表单提交(AJAX方式)
 */
form.on('submit(*)', function (data) {
    $.ajax({
        url: data.form.action,
        type: data.form.method,
        data: $(data.form).serialize(),
        success: function (info) {
            if (info.code === 1) {
                setTimeout(function () {
                    location.href = info.url;
                }, 500);
            }
            layer.msg(info.msg);
        }
    });

    return false;
});

/**
 * 通用批量处理（审核、取消审核、删除）
 */
$('.ajax-action').on('click', function () {
    var _action = $(this).data('action');
    layer.open({
        shade: false,
        content: '确定执行此操作？',
        btn: ['确定', '取消'],
        yes: function (index) {
            $.ajax({
                url: _action,
                data: $('.ajax-form').serialize(),
                success: function (info) {
                    if (info.code === 1) {
                        setTimeout(function () {
                            location.href = info.url;
                        }, 1000);
                    }
                    layer.msg(info.msg);
                }
            });
            layer.close(index);
        }
    });

    return false;
});

/**
 * 通用全选
 */
$('.check-all').on('click', function () {
    $(this).parents('table').find('input[type="checkbox"]').prop('checked', $(this).prop('checked'));
});

/**
 * 通用删除
 */
$('.ajax-delete').on('click', function () {
    var _href = $(this).attr('href');
    layer.open({
        shade: false,
        content: '确定删除？',
        btn: ['确定', '取消'],
        yes: function (index) {
            $.ajax({
                url: _href,
                type: "get",
                success: function (info) {
                    if (info.code === 1) {
                        setTimeout(function () {
                            location.href = info.url;
                        }, 1000);
                    }
                    layer.msg(info.msg);
                }
            });
            layer.close(index);
        }
    });

    return false;
});

/**
 * 清除缓存
 */
$('#clear-cache').on('click', function () {
    var _url = $(this).data('url');
    if (_url !== 'undefined') {
        $.ajax({
            url: _url,
            success: function (data) {
                if (data.code === 1) {
                    setTimeout(function () {
                        location.href = location.pathname;
                    }, 1000);
                }
                layer.msg(data.msg);
            }
        });
    }

    return false;
});

/**
 * 点击打开或关闭右侧菜单栏
 */
$('#menuButton').on('click', function () {
    if($('#closeMenu').parent().width() > 0){
        $('#closeMenu').parent().css('width', '0');
    }else{
        $('#closeMenu').parent().css('width', '200px');
        $('.layui-body').on('click',function () {
            $('#closeMenu').parent().css('width','0');
            $('.layui-body').unbind()
        });
        $('.layui-side').on('click',function () {
            $('#closeMenu').parent().css('width','0');
            $('.layui-side').unbind()
        })
        $('.layui-footer').on('click',function () {
            $('#closeMenu').parent().css('width','0');
            $('.layui-footer').unbind()
        })
    }
});
/**
 * 点击“关闭”,关闭右侧菜单栏
 */
$('#closeMenu').on('click', function () {
    $('#closeMenu').parent().css('width','0');
});

/**
 * 分页跳转
 */
$('#jump').on('click', function () {
    var _url = $(this).attr('data-url');
    var page = $('#jump_input').val();
    if (_url !== undefined) {
        window.location.href = _url + '?page=' + page;
        return false;
    }
});

/*必填项，红色的星号*/
$('input[lay-verify=required]').parent().addClass('required-item');
