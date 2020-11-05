package com.todd.huihuimall.filter;

import com.todd.huihuimall.config.InitParams;
import com.todd.huihuimall.domain.UserInfo;
import com.todd.huihuimall.util.FactoryUtil;
import com.todd.huihuimall.util.Forwarder;
import sun.misc.Request;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebFilter(filterName = "Global Filter", urlPatterns = "/*")
public class GlobalFilter implements Filter {

    private String[] whiteList = new String[]{
            ".css",
            ".js",
            ".jpg",
            ".png",
            ".jpeg",
            ".mp4",
            ".css.map",
            "/verificationCode",
            "/index.jsp",
            InitParams.LOGINPAGE,
            "/login",
            InitParams.REGISTERPAGE,
            "/register",
            "/logout",

            "/test"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest old_req, ServletResponse old_res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) old_res;
        HttpServletRequest req = (HttpServletRequest) old_req;
        req.setCharacterEncoding("utf-8");
        res.setCharacterEncoding("utf-8");
        res.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
        res.setHeader("Pragma", "no-cache"); //HTTP 1.0
        res.setDateHeader("Expires", 0); //prevents caching at the proxy server
        res.setHeader("Access-Control-Allow-Origin","*"); // 允许跨域

        // 如果是/的方式访问首页, 就跳到index.jsp
        if (req.getRequestURI().endsWith(req.getContextPath() + "/")) {
            res.setContentType("text/html;charset=utf-8");
            req.getRequestDispatcher("index.jsp").forward(req, res);
            return;
        }
        // 白名单直接释放
        if (Arrays.stream(whiteList).anyMatch(e -> req.getRequestURI().endsWith(e))) {
            // 如果不是css,js,jpg...就要设置content-type, 否则不要设置
            if (!isCssJSJpg(req.getRequestURI())) {
                res.setContentType("text/html;charset=utf-8");
            }
            System.out.println("放行请求:"+req.getRequestURI());
            chain.doFilter(req, res);
        } else {
            // 不是白名单, 就要检测是否登录
            res.setContentType("text/html;charset=utf-8");
            UserInfo currentUserInfo = (UserInfo) req.getSession().getAttribute("currentUserInfo");
//            UserInfo currentUserInfo = new UserInfo()
//                    .setId(FactoryUtil.getRandomUUID())
//                    .setUserName("余承东")
//                    .setPassword("123")
//                    .setTypeId("usertypeid001")
//                    .setStatus("在线");
            req.getSession().setAttribute("currentUserInfo", currentUserInfo);
            System.out.println("当前登录用户:" + currentUserInfo);
            if (null == currentUserInfo || currentUserInfo.getId().equals("")) {
                System.err.println("拦截请求:"+req.getRequestURI());
                Forwarder.showErrorPageAndToNewPage(req, res, "请先登录", req.getContextPath()+InitParams.LOGINPAGE);
                return;
            } else {
                System.out.println("放行请求:"+req.getRequestURI());
                chain.doFilter(req, res);
            }
        }
    }

    @Override
    public void destroy() {

    }

    private boolean isCssJSJpg(String uri) {
        return Arrays.stream(new String[]{
                ".css",
                ".js",
                ".jpg",
                ".png",
                ".jpeg",
                ".mp4"
        }).anyMatch(s -> uri.endsWith(s));
    }

}
