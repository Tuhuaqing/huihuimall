package com.todd.huihuimall.servlet;

import com.mysql.cj.Session;
import com.todd.huihuimall.config.InitParams;
import com.todd.huihuimall.domain.UserInfo;
import com.todd.huihuimall.service.UserInfoService;
import com.todd.huihuimall.util.FactoryUtil;
import com.todd.huihuimall.util.Forwarder;
import sun.misc.Request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final long serialVersionUID = 1L;

    private UserInfoService userInfoService = new UserInfoService();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String verificationCode = req.getParameter("verificationCode").toUpperCase();
        HttpSession ss = req.getSession();

        // 是否缺少参数
        if ("".equals(userName) || "".equals(password) || "".equals(verificationCode)
        ) {
            Forwarder.showErrorPageAndToNewPage(req, res, "缺少参数, 请2秒后重新注册", req.getContextPath() + InitParams.REGISTERPAGE);
            return;
        }
        // 看用户名是否已经存在
        if (!(null == userInfoService.getOneByUserName(userName))) {
            Forwarder.showErrorPageAndToNewPage(req, res, "该用户已存在, 请2秒后重新注册", req.getContextPath() + InitParams.REGISTERPAGE);
            return;
        }
        // 看验证码是否正确
        if (!ss.getAttribute("correctVerificationCode").toString().toUpperCase().equals(verificationCode)) {
            Forwarder.showErrorPageAndToNewPage(req, res, "验证码错误, 请2秒后重新注册", req.getContextPath() + InitParams.REGISTERPAGE);
            return;
        }
        // 开始注册
        UserInfo registingUserInfo = new UserInfo()
                .setId(FactoryUtil.getRandomUUID())
                .setUserName(userName)
                .setPassword(password)
                .setTypeId("usertypeid002")
                .setStatus(null);
        if (userInfoService.addOne(registingUserInfo)) {
            Forwarder.showErrorPageAndToNewPage(req, res, "注册成功, 正在跳转至首页", req.getContextPath() + "/index.jsp");
            ss.setAttribute("currentUserInfo", registingUserInfo);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
