<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>第四页</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.0/axios.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.all.js"></script>
    <style>
        body {
            padding: 0px;
            margin: 0px;
            background: url(./img/purple_bg.jpg) no-repeat center;
            /* background: hsla(0, 0%, 0%, .9); */
            background-position-x: center;
            background-position-y: center;
            background-size: cover;
            background-attachment: fixed;
            background-origin: initial;
            background-clip: initial;
            background-color: initial;
            background-position: center;
            background-size: cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        /*返回首页*/
        .back{
            position: fixed;
            left: 20px;
            top: 20px;
            width: 50px;
            height: 50px;
            background: dodgerblue;
            color: white;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            line-height: 50px;
            border-radius: 50%;
            user-select: none;
            box-shadow: 0 19px 28px 0 rgba(0,0,0,.18);
            cursor: pointer;
        }
        .back:hover{
            transform: scale(1.2);
            transition: all 0.2s;
        }

        .header {
            text-align: center;
            font-size: 28px;
            color: white;
            margin-top: 150px;
        }

        /*火焰字*/
        @import url(https://fonts.googleapis.com/css?family=Varela+Round);
        .fire {
            color: hsla(0, 0%, 0%, .9);
            font: normal 118px Varela Round, sans-serif;
            font-family: "幼圆";
            height: 140px;
            letter-spacing: 5px;
            margin: -80px 0 0 0;
            text-align: center;
            text-transform: uppercase;
            width: 100%;
            animation: move linear 2000ms infinite;
        }

        @keyframes move {
            0% {
                text-shadow: 4px -4px 0 hsla(0, 100%, 50%, 1),
                3px -3px 0 hsla(0, 100%, 50%, 1),
                2px -2px 0 hsla(0, 100%, 50%, 1),
                1px -1px 0 hsla(0, 100%, 50%, 1),
                -4px 4px 0 hsla(180, 100%, 50%, 1),
                -3px 3px 0 hsla(180, 100%, 50%, 1),
                -2px 2px 0 hsla(180, 100%, 50%, 1),
                -1px 1px 0 hsla(180, 100%, 50%, 1);
            }

            25% {
                text-shadow: -4px -4px 0 hsla(180, 100%, 50%, 1),
                -3px -3px 0 hsla(180, 100%, 50%, 1),
                -2px -2px 0 hsla(180, 100%, 50%, 1),
                -1px -1px 0 hsla(180, 100%, 50%, 1),
                4px 4px 0 hsla(0, 100%, 50%, 1),
                3px 3px 0 hsla(0, 100%, 50%, 1),
                2px 2px 0 hsla(0, 100%, 50%, 1),
                1px 1px 0 hsla(0, 100%, 50%, 1);
            }

            50% {
                text-shadow: -4px 4px 0 hsla(0, 100%, 50%, 1),
                -3px 3px 0 hsla(0, 100%, 50%, 1),
                -2px 2px 0 hsla(0, 100%, 50%, 1),
                -1px 1px 0 hsla(0, 100%, 50%, 1),
                4px -4px 0 hsla(180, 100%, 50%, 1),
                3px -3px 0 hsla(180, 100%, 50%, 1),
                2px -2px 0 hsla(180, 100%, 50%, 1),
                1px -1px 0 hsla(180, 100%, 50%, 1);
            }

            75% {
                text-shadow: 4px 4px 0 hsla(180, 100%, 50%, 1),
                3px 3px 0 hsla(180, 100%, 50%, 1),
                2px 2px 0 hsla(180, 100%, 50%, 1),
                1px 1px 0 hsla(180, 100%, 50%, 1),
                -4px -4px 0 hsla(0, 100%, 50%, 1),
                -3px -3px 0 hsla(0, 100%, 50%, 1),
                -2px -2px 0 hsla(0, 100%, 50%, 1),
                -1px -1px 0 hsla(0, 100%, 50%, 1);
            }

            100% {
                text-shadow: 4px -4px 0 hsla(0, 100%, 50%, 1),
                3px -3px 0 hsla(0, 100%, 50%, 1),
                2px -2px 0 hsla(0, 100%, 50%, 1),
                1px -1px 0 hsla(0, 100%, 50%, 1),
                -4px 4px 0 hsla(180, 100%, 50%, 1),
                -3px 3px 0 hsla(180, 100%, 50%, 1),
                -2px 2px 0 hsla(180, 100%, 50%, 1),
                -1px 1px 0 hsla(180, 100%, 50%, 1);
            }
        }

        .info {
            text-align: center;
            font-size: 38px;
            color: gold;
        }

        .search-wrapper {
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
        }

        .search-wrapper.active {
        }

        .search-wrapper .input-holder {
            height: 70px;
            width: 70px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0);
            border-radius: 6px;
            position: relative;
            transition: all 0.3s ease-in-out;
        }

        .search-wrapper.active .input-holder {
            width: 450px;
            border-radius: 50px;
            background: rgba(0, 0, 0, 0.5);
            transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
        }

        .search-wrapper .input-holder .search-input {
            width: 100%;
            height: 50px;
            padding: 0px 70px 0 20px;
            opacity: 0;
            position: absolute;
            top: 0px;
            left: 0px;
            background: transparent;
            box-sizing: border-box;
            border: none;
            outline: none;
            font-family: "Open Sans", Arial, Verdana;
            font-size: 16px;
            font-weight: 400;
            line-height: 20px;
            color: #FFF;
            transform: translate(0, 60px);
            transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            transition-delay: 0.3s;
        }

        .search-wrapper.active .input-holder .search-input {
            opacity: 1;
            transform: translate(0, 10px);
        }

        .search-wrapper .input-holder .search-icon {
            width: 70px;
            height: 70px;
            border: none;
            border-radius: 6px;
            background: #FFF;
            padding: 0px;
            outline: none;
            position: relative;
            z-index: 2;
            float: right;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .search-wrapper.active .input-holder .search-icon {
            width: 50px;
            height: 50px;
            margin: 10px;
            border-radius: 30px;
        }

        .search-wrapper .input-holder .search-icon span {
            width: 22px;
            height: 22px;
            display: inline-block;
            vertical-align: middle;
            position: relative;
            transform: rotate(45deg);
            transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
        }

        .search-wrapper.active .input-holder .search-icon span {
            transform: rotate(-45deg);
        }

        .search-wrapper .input-holder .search-icon span::before,
        .search-wrapper .input-holder .search-icon span::after {
            position: absolute;
            content: '';
        }

        .search-wrapper .input-holder .search-icon span::before {
            width: 4px;
            height: 11px;
            left: 9px;
            top: 18px;
            border-radius: 2px;
            background: #FE5F55;
        }

        .search-wrapper .input-holder .search-icon span::after {
            width: 14px;
            height: 14px;
            left: 0px;
            top: 0px;
            border-radius: 16px;
            border: 4px solid #FE5F55;
        }

        .search-wrapper .close {
            position: absolute;
            z-index: 1;
            top: 24px;
            right: 20px;
            width: 25px;
            height: 25px;
            cursor: pointer;
            transform: rotate(-180deg);
            transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
            transition-delay: 0.2s;
        }

        .search-wrapper.active .close {
            right: -50px;
            transform: rotate(45deg);
            transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            transition-delay: 0.5s;
        }

        .search-wrapper .close::before,
        .search-wrapper .close::after {
            position: absolute;
            content: '';
            background: #FE5F55;
            border-radius: 2px;
        }

        .search-wrapper .close::before {
            width: 5px;
            height: 25px;
            left: 10px;
            top: 0px;
        }

        .search-wrapper .close::after {
            width: 25px;
            height: 5px;
            left: 0px;
            top: 10px;
        }
    </style>
</head>

<body>
<div class="back">
    <span class="t">&lt;</span>
</div>
<header class="header">
    <h1>欢迎进入 <span class="fire">第四页</span></h1>
</header>
<div class="search-wrapper">
    <div class="input-holder">
        <input id="keyword" type="text" class="search-input" placeholder="Type to search" onfocus="clearInfo()"/>
        <button class="search-icon" onclick="searchToggle(this);"><span></span></button>
    </div>
    <span class="close" onclick="searchToggle(this);"></span>
</div>
<div id="info" class="info">
</div>
<script>
    // String去掉两边空格的方法
    String.prototype.trim = function () {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }

    var layer = layui.layer

    // 搜索按钮
    function searchToggle(obj) {
        var container = $(obj).closest('.search-wrapper');
        if (!container.hasClass('active')) {
            container.addClass('active');
        } else if (container.hasClass('active') && $(obj).closest('.input-holder').length == 0) {
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
        // 开始调用接口
        var el_keyword = $('#keyword')
        let keyword = (el_keyword.val() || "").trim()
        if (!!keyword) {
            let loading = layer.load()
            axios.get("http://localhost:8080/huihuimall/test", {
                params: {
                    keyword: keyword
                }
            }).then(({
                         data
                     }) => {
                layer.close(loading)
                el_keyword.val("")
                if (data == true || data == "true") {
                    $("#info").html('(>‿◠)✌ 数据爬取成功')
                }
            })
        }
    }

    function clearInfo() {
        $('#info').text('')
    }


    //阻止浏览器的默认行为
    function stopDefault(e) {
        //阻止默认浏览器动作(W3C)
        if (e && e.preventDefault)
            e.preventDefault();
        //IE中阻止函数器默认动作的方式
        else
            window.event.returnValue = false;
        return false;
    }
</script>
</body>

</html>