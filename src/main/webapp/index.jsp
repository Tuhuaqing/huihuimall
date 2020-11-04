<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ page import="com.todd.huihuimall.domain.UserInfo" %>
<%@ page import="com.todd.huihuimall.domain.ProductInfo" %>
<%@ page import="com.todd.huihuimall.service.ProductInfoService" %>
<%@ page import="static com.todd.huihuimall.util.CheckUtil.isEmpty" %>
<%@ page import="static com.todd.huihuimall.util.CheckUtil.isNotEmpty" %>
<%@ page import="java.util.function.*" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="com.todd.huihuimall.util.StreamUtil" %>
<%@ page import="com.todd.huihuimall.config.InitParams" %>
<%@ page import="java.awt.font.ShapeGraphicAttribute" %>
<%
    // 搜索关键字
    String likeword = request.getParameter("likeword");
    // 要展示的页码
    String currentPage = request.getParameter("p");
    Integer p = isEmpty(currentPage) ? 1 : Integer.valueOf(currentPage);

    // 根据条件进行筛选展示>>>>>>>>>>>>>>>>>>>>>
    // 先拿到所有商品数据
    List<ProductInfo> products = new ProductInfoService().getAll();
    // 关键字筛选
    if (isNotEmpty(likeword)) {
        products = StreamUtil.FilterProductInfoLikeword(products.stream(), likeword);
    }
    // 一页20条数据, 共有多少页?
    Integer shang = products.size() / InitParams.PAGESIZE;
    Integer productSize = products.size();
    Integer pageCount = 0;
    if(productSize<=20){
        pageCount = 1;
    }else if (productSize%InitParams.PAGESIZE==0){
        pageCount = shang;
    }else{
        pageCount = shang+1;
    }
    // 只看当前页
    // 存入内存
    request.setAttribute("products", products);
%>
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
            <form action="index.jsp" method="get">
                <div>
                    <input type="text" name="likeword" class="search-txt"/>
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
                    <span style="color:dodgerblue"><%=((UserInfo) session.getAttribute("currentUserInfo")).getUserName()%></span>
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
                <c:forEach var="product" items="${products}">
                    <li class="goods-item">
                        <a href="${product.detailUrl}">
                            <img src="${product.imgUrl}" alt="" width="195" height="195"
                                 class="goods-img"/>
                            <p class="to-store">直达商品</p>
                            <div class="goods-info">
                                <p class="goods-price clearfloat">
                                    <span><c:out value="${product.productPrice}"/></span>
                                    <img src="img/icon_steady.png"/>
                                </p>
                                <p class="goods-des">
                                    <c:out value="${product.productName}"/>
                                </p>
                                <span class="goods-coupon"><c:out value="${product.productType.typeName}"/></span>
                                <span class="goods-num">库存 ${product.productCount}</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!--更多-->
        <div class="more-pages">
            <a class="direction-page" href="#"><</a>
            第<%=p%>页&nbsp;&nbsp;/&nbsp;&nbsp; 共<%=pageCount%>页
            <a class="direction-page" href="#">></a>
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
