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
<%@ page import="com.github.pagehelper.PageHelper" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%
    // 准备搜索关键字
    String likeword = request.getParameter("likeword");
    if (null != likeword) {
        likeword = likeword.trim();
        likeword = likeword == "null" ? "" : likeword;
    }
    // 准备分页相关的参数
    String p = request.getParameter("p");
    Integer currentPage = isEmpty(p) ? 1 : Integer.valueOf(p);
    // 准备service
    ProductInfoService productInfoService = new ProductInfoService();
    // 准备容器
    PageInfo<ProductInfo> pageInfo = null;
    List<ProductInfo> products = null;

    // 如果有关键字就筛选, 否则拿到全部(分页是在模糊查询之后才做的)
    PageHelper.startPage(currentPage, InitParams.PAGESIZE);
    if (isNotEmpty(likeword)) {
        pageInfo = new PageInfo<ProductInfo>(productInfoService.getByLikeword(likeword));
        products = pageInfo.getList();
    } else {
        pageInfo = new PageInfo(productInfoService.getAll());
        products = pageInfo.getList();
    }
    int pageCount = pageInfo.getPages();


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
    <style>
        .fourth{
            position: fixed;
            right: 20px;
            bottom: 20px;
            width: 50px;
            height: 50px;
            background: dodgerblue;
            color: white;
            font-size: 20px;
            text-align: center;
            line-height: 50px;
            border-radius: 50%;
            user-select: none;
            box-shadow: 0 19px 28px 0 rgba(0,0,0,.18);
            cursor: pointer;
        }
        .fourth:hover{
            transform: scale(1.2);
            transition: all 0.2s;
        }
    </style>
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
<%--        <div class="choice">--%>
<%--            <h3 class="choice-title">全网好货</h3>--%>
<%--            <!--商城-->--%>
<%--            <div class="store">--%>
<%--                <span class="store-title">商城：</span>--%>
<%--                <ul class="store-ul clear-float">--%>
<%--                    <li>--%>
<%--                        <input type="checkbox" class="chk" id="chk1" checked="checked"/>--%>
<%--                        <label for="chk1">淘宝精选</label>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <input type="checkbox" class="chk" id="chk2" checked="checked"/>--%>
<%--                        <label for="chk2">京东精选</label>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <input type="checkbox" class="chk" id="chk3" checked="checked"/>--%>
<%--                        <label for="chk3">当当精选</label>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <input type="submit" value="提交" class="store-btn"/>--%>
<%--            </div>--%>
<%--            <!--排序-->--%>
<%--            <div class="order">--%>
<%--                <span class="order-title">排序：</span>--%>
<%--                <ul class="order-ul clear-float">--%>
<%--                    <li class="order-price">--%>
<%--                        <a href="#">价格</a>--%>
<%--                        <span id="up-icon"></span>--%>
<%--                        <span id="down-icon"></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#">--%>
<%--                            <input type="number" placeholder="￥"/> ---%>
<%--                            <input type="number" placeholder="￥"/>--%>
<%--                        </a>--%>
<%--                        <a href="#" class="price-sure store-btn">确定</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
        <!--商品展示-->
        <div class="goods-show">
            <ul class="clearfloat">
                <c:forEach var="product" items="${products}">
                    <li class="goods-item">
                        <a href="${product.detailUrl}">
                            <img src="${product.imgUrl}" alt="" width="195" height="195"
                                 class="goods-img"/>
                            <p class="to-store">前往购买</p>
                            <div class="goods-info">
                                <p class="goods-price clearfloat">
                                    <span>¥<c:out value="${product.productPrice}"/></span>
                                    <img src="img/icon_steady.png"/>
                                </p>
                                <p class="goods-des">
                                    <c:out value="${product.productName}"/>
                                </p>
                                <span class="goods-coupon"><c:out value="${product.productType.typeName}"/></span>
                                <span class="goods-num">库存 ${product.productCount}</span>
                                <span class="goods-num">${product.productStatus}</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!--更多-->
        <div class="more-pages">
            <!--上一页专用表单-->
            <form name="prev_page_form" action="index.jsp" method="get">
                <input type="hidden" name="likeword" value="<%=likeword==null?"":likeword%>">
                <input type="hidden" name="p" value="<%=currentPage-1%>">
            </form>
            <!--下一页专用表单-->
            <form name="next_page_form" action="index.jsp" method="get">
                <input type="hidden" name="likeword" value="<%=likeword==null?"":likeword%>">
                <input type="hidden" name="p" value="<%=currentPage+1%>">
            </form>
            <c:if test="<%=currentPage>1%>">
                <a class="direction-page" href="javascript:document.forms.namedItem('prev_page_form').submit()"><</a>
            </c:if>
            第<%=currentPage%>页&nbsp;&nbsp;/&nbsp;&nbsp;共<%=pageCount%>页
            <c:if test="<%=currentPage<pageCount%>">
                <a class="direction-page" href="javascript:document.forms.namedItem('next_page_form').submit()">></a>
            </c:if>
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


<!--第四页入口-->
<div class="fourth">
    <span onclick="location.href='fourth.jsp'" class="t">Fourth</span>
</div>
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
