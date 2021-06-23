package com.corepower.controller;

import com.corepower.service.UserService;
import com.corepower.domain.User;
import  com.corepower.domain.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.corepower.util.MD5Util;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    /**
     * 用户登录
     */
    /**
     * 将提交数据(username,password)写入User对象
     */
    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(User user, Model model, HttpSession session) {
        // 通过账号和密码查询用户
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        User ad = userService.findUser(user);
        if(ad!=null){
            session.setAttribute("ad", ad);
            return "homepage";
        }
        model.addAttribute("msg", "账号或密码错误");
        return "login";
    }
    /**
     * 退出登录
     */
    @RequestMapping(value = "/loginOut")
    public String loginOut(User user, Model model, HttpSession session) {
        session.invalidate();
        return "login";

    }
    /**
     * 查询所有用户信息列表
     */
    @RequestMapping(value = "/findUser")
    public String findUser(String username, String relname,Integer pageIndex, Integer id ,Integer pageSize, Model model) {
        PageInfo<User> ai = userService.findPageInfo(username,relname,id,pageIndex,pageSize);
        model.addAttribute("ai",ai);
        return "admin_list";
    }
    /**
     * 添加管理员信息
     */
    @RequestMapping(value = "/addUser" ,method = RequestMethod.POST)
    @ResponseBody
    public String addUser(User user) {
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        int a = userService.addUser(user);
        return "homepage";
    }
    /**
     * 删除管理员信息；将请求体a_id写入参数a_id
     */
    @RequestMapping( "/deleteUser")
    @ResponseBody
    public String deleteUser(Integer id) {
        System.out.println(id);
        int a = userService.deleteUser(id);
        return "admin_list";
    }
    /**
     * 修改管理员信息
     */
    /**
     * 将提交数据(a_id,a_username...)写入Admin对象
     */
    @RequestMapping( value = "/updateUser", method = RequestMethod.POST)
    @ResponseBody
    public String updateUser(@RequestBody User user) {
        System.out.println(user);
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        int a = userService.updateUser(user);
        int b = userService.updateInf(user);
        return "redirect:/findUser";
    }
    /**
     * 根据管理员Id搜索;将请求数据a_id写入参数a_id
     */
    @RequestMapping( value="/findUserById")
    public String findUserById( Integer id,HttpSession session) {
        User a= userService.findUserById(id);
        System.out.println(a);
        session.setAttribute("a",a);
        return "admin_edit";
    }
    /**
     * 修改当前登录用户的密码
     */
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public String updatePassword(@RequestBody User user){
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        userService.updatePassword(user);
        return "homepage";
    }
    //页面跳转
    @RequestMapping("/homepage")
    public String homepage() {
        return "homepage";
    }
}
