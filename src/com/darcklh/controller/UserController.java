package com.darcklh.controller;

import com.darcklh.utils.VertifyCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("user")
public class UserController {

    @RequestMapping("doLogin")
    public String login(String username, String password, String code, HttpSession session, HttpServletResponse response) {
        System.out.println("给点ge");
        //设置返回格式
        response.setContentType("text/html;charset=utf-8");
        //获取验证码
        String vertifyCode = (String) session.getAttribute("code");
        //判断验证码
        if (vertifyCode.equalsIgnoreCase(code)) {
            System.out.println("登录成功哦");
        } else {
            System.out.println("登陆失败哦");
            return "login.jsp";
        }
        return "index.jsp";
    }

    public String test() {
        return  "来了来了";
    }

}
