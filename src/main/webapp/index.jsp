<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ page import="com.todd.huihuimall.domain.UserInfo" %>
<%--
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <meta HTTP-EQUIV="Expires" CONTENT="0">
    <title>惠惠首页</title>
    <link type="text/css" rel="stylesheet" href="css/reset.css"/>
    <link type="text/css" rel="stylesheet" href="css/header.css"/>
    <link type="text/css" rel="stylesheet" href="css/main.css"/>
    <link type="text/css" rel="stylesheet" href="css/footer.css"/>
</head>
<body>
<!--网页头部-->
<div class="header">
    <div class="header-main w1300">
        <!--logo-->
        <a href="index.jsp" class="logo">
            <img src="img/logo.png"/>
        </a>
        <!--搜索框-->
        <div class="search">
            <form action="#" method="get">
                <div>
                    <input type="text" class="search-txt"/>
                </div>
                <div class="sub-btn">
                    <input type="submit" value="" class="sub-img"/>
                </div>
            </form>
        </div>
        <!--登录按钮-->
        <div class="header-link">
            <c:choose>
                <c:when test="${sessionScope.currentUserInfo eq null}">
                    <a href="login.jsp" class="login">登录</a>
                </c:when>
                <c:otherwise>
                    <span>当前用户:</span>
                    <span style="color:dodgerblue"><%=((UserInfo)session.getAttribute("currentUserInfo")).getUserName()%></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a style="color: #d0021b" href="logout">注销</a>
                </c:otherwise>
            </c:choose>

            <span class="down-icon"></span>
            <span class="line">|</span>
            <a href="#" class="account">我的账户</a>
            <span class="down-icon"></span>
        </div>
    </div>
</div>
<!--网页主体内容-->
<div class="contain w1300 clearfloat">
    <!--中心内容左边-->
    <div class="contain-left">
        <!--筛选-->
        <div class="choice">
            <h3 class="choice-title">全网好货</h3>
            <!--商城-->
            <div class="store">
                <span class="store-title">商城：</span>
                <ul class="store-ul clear-float">
                    <li>
                        <input type="checkbox" class="chk" id="chk1" checked="checked"/>
                        <label for="chk1">淘宝精选</label>
                    </li>
                    <li>
                        <input type="checkbox" class="chk" id="chk2" checked="checked"/>
                        <label for="chk2">京东精选</label>
                    </li>
                    <li>
                        <input type="checkbox" class="chk" id="chk3" checked="checked"/>
                        <label for="chk3">当当精选</label>
                    </li>
                </ul>
                <input type="submit" value="提交" class="store-btn"/>
            </div>
            <!--排序-->
            <div class="order">
                <span class="order-title">排序：</span>
                <ul class="order-ul clear-float">
                    <li class="order-price">
                        <a href="#">价格</a>
                        <span id="up-icon"></span>
                        <span id="down-icon"></span>
                    </li>
                    <li>
                        <a href="#">
                            <input type="number" placeholder="￥"/> -
                            <input type="number" placeholder="￥"/>
                        </a>
                        <a href="#" class="price-sure store-btn">确定</a>
                    </li>
                </ul>
            </div>
        </div>
        <!--商品展示-->
        <div class="goods-show">
            <ul class="clearfloat">
                <li class="goods-item">
                    <a href="#">
                        <img src="img/1boje2um391_800_800.jpg" alt="" width="195" height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥88.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                网易智造 USB智能充电器(4U) 手机配件 手机充电器 多功能充电器
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/6b198b81-e1f0-4c32-8f72-66da7931dd2c.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥549.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                【限时特惠】Audio Technica 铁三角 WS550iS 便携式智能手机耳麦低频强劲 手机耳机 国行正品
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/d95c1d29-e90e-4241-8ce9-e2e77914a0dc.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥2798.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                魅族 16th 全面屏游戏手机 6GB+128GB 全网通移动联通电信4G手机 双卡双待
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/4e29f086-b74d-40ce-b245-db6c9b4319bc.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥69.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                tech21官方手机壳 Phone8/8p防摔时尚款保护套苹果官方手机壳全包
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/19042071-1618-4a9e-99ff-50829aca066f.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥49.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                X-doria 漫威iPhoneXs手机壳Xs Max潮牌潮品玻璃质感全包防摔苹果XR手机保护套
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/1ck78n5jc72_800_800.jpg" alt="" width="195" height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥2699.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                MI 小米 8 全面屏 6GB+64GB 黑色 全网通4G手机 双卡双待 拍照游戏智能手机
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/f91214f0-7272-47cb-9c8d-5a4a8d0b7b8f.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥59.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                X-doria iPhoneX商务手机壳凌范全包软边防摔苹果X透明手机保护套
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/TB16S7YkhTI8KJjSspiXXbM4FXa_!!0-item_pic.jpg_430x430q90.jpg" alt="" width="195"
                             height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥9.9</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                希捷手机支架 手机指环
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/6c0d51d9-7110-4ad3-91c8-c2402ea20e33.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥449.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                小天才 电话手表 Y01A 浅紫+原装浅紫表带组合 儿童智能手表360度安全防护 学生定位手机 儿童手机
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/f5769baab38f42e388b5dbaad4641f3b1512633554920jaw6yoqy12412.jpg" alt="" width="195"
                             height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥3499.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                一加手机5T 熔岩红 全网通 移动联通电信4G手机 双卡双待 国行保修
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/1c8uct3so40_800_800.jpg" alt="" width="195" height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥3299.0</span>
                                <img src="img/icon_up.png"/>
                            </p>
                            <p class="goods-des">
                                小米 MIX2 全面屏游戏手机 6GB+64GB 黑色 全网通4G手机 双卡双待
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/7a66740a239d4407819411294d9620841521431743462jexp6eh112097.jpg" alt="" width="195"
                             height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥1299.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                小米5X 美颜双摄拍照手机 4GB+32GB 全网通4G手机 双卡双待
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/d79ec3b4d0cf43b29ba5c0fd622bfc801522389459589jfdjdkyi21453.jpg" alt="" width="195"
                             height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥2699.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                小米MIX2S 全面屏游戏手机 6GB+64GB 全网通4G 陶瓷手机
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/a25db096-e0d8-4c4f-813f-fc1db8c70e41.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥58.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                X-doria 漫威iPhoneXs手机壳Xs Max防滑防汗潮牌新款全包防摔苹果XR手机保护套
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/e61c9c02-17cf-47fe-9847-19de31c4ff03.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥28.0</span>
                                <img src="img/icon_down.png"/>
                            </p>
                            <p class="goods-des">
                                Momax摩米士 iPhoneX硅胶防摔手机壳全包透明手机套苹果X超薄保护套软
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/1ck9hpnjv26_800_800.jpg" alt="" width="195" height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥3299.0</span>
                                <img src="img/icon_up.png"/>
                            </p>
                            <p class="goods-des">
                                MI 小米8 全面屏 6GB+256GB 白色 全网通4G手机 双卡双待 拍照游戏智能手机
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/441c161b-9d82-463d-9919-171d4223a6b8.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥49.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                【魔影系列】NORTHJO诺左 iPhone手机壳 苹果磨砂防摔全包手机套 超薄保护套-红色/黑色-XS/XR/XS MAX
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/1ck9gf53h62_800_800.jpg" alt="" width="195" height="195" class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥2999.0</span>
                                <img src="img/icon_up.png"/>
                            </p>
                            <p class="goods-des">
                                MI 小米8 全面屏 6GB+128G 金色 全网通4G手机 双卡双待 拍照游戏智能手机
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/3f0510ab-b890-4e12-ba83-fd6fef320036.jpg" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥69.9</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                X-doria HelloKitty苹果X萌趣硅胶手机壳全包防摔蓝牙自拍支架卡通手机保护套
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
                <li class="goods-item">
                    <a href="#">
                        <img src="img/92652b97-1a2b-44a6-979e-ddfac97ae625.png" alt="" width="195" height="195"
                             class="goods-img"/>
                        <p class="to-store">直达商品</p>
                        <div class="goods-info">
                            <p class="goods-price clearfloat">
                                <span>￥58.0</span>
                                <img src="img/icon_steady.png"/>
                            </p>
                            <p class="goods-des">
                                ROCK 华为MATE20 3D浮雕手机壳鱼趣横生花艺芬芳华为DFH认证手机壳
                            </p>
                            <span class="goods-coupon">淘宝</span>
                            <span class="goods-num">销量0</span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>

        <div class="more-pages">
            <a class="direction-page" href="#"><</a> 第1页&nbsp;&nbsp;/&nbsp;&nbsp; 共7页 <a class="direction-page"
                                                                                         href="#">></a>

        </div>


    </div>


    <!--中心内容右边-->
    <div class="contain-right">
        <a href="#" class="right-link">
            <img src="img/image.jpg"/>
        </a>
        <!--热门折扣-->
        <div class="discount">
            <div class="hd clearfloat">
                <h1>4小时热门折扣</h1>
                <a href="#" class="more">更多</a>
            </div>
            <ul>
                <li><a href="#">
                    <img src="img/image1.png" alt="" class="discount-img"/>
                    <div class="title">
                        <p class="discount-des">Skechers 斯凯奇 幼童运动鞋 </p>
                        <span class="user">浏览112次</span>
                    </div>
                </a></li>
                <li><a href="#">
                    <img src="img/image2.png" alt="" class="discount-img"/>
                    <div class="title">
                        <p class="discount-des">Yijan 易简 G820 女宝电动理发器 +凑单品 </p>
                        <span class="user">浏览109次</span>
                    </div>
                </a></li>
                <li><a href="#">
                    <img src="img/image3.png" alt="" class="discount-img"/>
                    <div class="title">
                        <p class="discount-des">Aprica 阿普丽佳 魔捷轻风 高景观婴儿推车蓝色 </p>
                        <span class="user">浏览100次</span>
                    </div>
                </a></li>
                <li><a href="#">
                    <img src="img/image4.png" alt="" class="discount-img"/>
                    <div class="title">
                        <p class="discount-des">Skechers 斯凯奇 儿童网布运动鞋 </p>
                        <span class="user">浏览89次</span>
                    </div>
                </a></li>
            </ul>
        </div>
        <a href="#" class="right-link">
            <img src="img/image2.jpg"/>
        </a>
        <a href="#" class="right-link">
            <img src="img/image1.jpg"/>
        </a>
    </div>
</div>
<!--网页脚注-->
<div class="footer">
    <div class="footer-main w1300">
        <div class="foot-link">
            <a href="#">关于我们</a>
            <span>|</span>
            <a href="#">官方博客</a>
            <span>|</span>
            <a href="#">商务合作</a>
            <span>|</span>
            <a href="#">友情链接</a>
            <span>|</span>
            <a href="#">加入我们</a>
            <span>|</span>
            <a href="#">帮助</a>
        </div>
        <p class="copy">&copy; 2019 网易公司 京ICP证080268号 京ICP备12032105号-1 京公网安备11010802020093号</p>
    </div>
</div>
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
