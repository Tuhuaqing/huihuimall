package com.todd.huihuimall.servlet;

import com.todd.huihuimall.config.InitParams;
import com.todd.huihuimall.domain.UserInfo;
import com.todd.huihuimall.service.UserInfoService;
import com.todd.huihuimall.util.Forwarder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserInfoService userInfoService = new UserInfoService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String verificationCode = req.getParameter("verificationCode").toUpperCase();
        HttpSession ss = req.getSession();
        UserInfo userInfo = null;
        // 是否缺少参数
        if ("".equals(userName) || "".equals(password) || "".equals(verificationCode)
        ) {
            Forwarder.showErrorPageAndToNewPage(req, res, "缺少参数", req.getContextPath() + InitParams.LOGINPAGE);
            return;
        }
        // 看用户名是否已经存在
        if (null == (userInfo = userInfoService.getOneByUserName(userName))) {
            Forwarder.showErrorPageAndToNewPage(req, res, "账户不存在", req.getContextPath() + InitParams.LOGINPAGE);
            return;
        }
        // 密码是否正确
        if (!password.equals(userInfo.getPassword())) {
            Forwarder.showErrorPageAndToNewPage(req, res, "密码错误", req.getContextPath() + InitParams.LOGINPAGE);
            return;
        }
        // 看验证码是否正确
        if (!ss.getAttribute("correctVerificationCode").toString().toUpperCase().equals(verificationCode)) {
            Forwarder.showErrorPageAndToNewPage(req, res, "验证码错误", req.getContextPath() + InitParams.LOGINPAGE);
            return;
        }
        // 开始登录
        ss.setAttribute("currentUserInfo", userInfo); // session存用户信息
        res.sendRedirect("index.jsp");
    }
}
