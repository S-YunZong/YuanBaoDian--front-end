package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import com.example.yuanbaodianfrontend.service.UserService;
import com.example.yuanbaodianfrontend.utils.SendSMSUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    //发送验证码
    @RequestMapping("fasong")
    @ResponseBody
    public boolean fasong(String tel, HttpSession session){
        int code=(int)((Math.random()*9+1)*10);
        session.setAttribute("code", code);
        boolean sendMSM = SendSMSUtils.sendMSM(tel,String.valueOf(code));
        return true;
    }
    //注册
    @ResponseBody
    @RequestMapping("zhuce")
    public boolean zhuce(String tel,String password){
        boolean zhuce = userService.zhuce(tel, password);
        return true;
    }
    //登陆
    @RequestMapping("login")
    @ResponseBody
    public boolean login(String phone, String password,HttpSession session){
        YbdUser login = userService.login(phone, password);
            if (login!=null){
                session.setAttribute("user_session",login);
                return true;
            }else {
                return false;
            }
    }
    //退出
    @RequestMapping("LoginOut")
    @ResponseBody
    public boolean LoginOut(HttpSession session){
        session.removeAttribute("LoginOut");
        return true;
    }
}
