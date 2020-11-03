package com.todd.huihuimall.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Forwarder {
    public static void showErrorPageAndToNewPage(HttpServletRequest req, HttpServletResponse res, String msg, String direction) throws IOException {
        try {
            // 设置attribute并跳转到error.jsp
//            HttpSession ss = req.getSession();
//            ss.setAttribute("msg",msg);
//            ss.setAttribute("direction",direction);
//            res.sendRedirect("error/error.jsp");

            req.setAttribute("msg", msg);
            req.setAttribute("direction",direction);
            req.getRequestDispatcher("error/error.jsp").forward(req, res);


//            PrintWriter out = res.getWriter();
//            out.println("错误信息:"+msg+",请前往:"+direction);
//            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
