package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.service.UserService;
import com.example.yuanbaodianfrontend.utils.SendSMSUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("fasong")
    @ResponseBody
    public boolean fasong(String tel, HttpSession session){
        int code=(int)((Math.random()*9+1)*10);
        session.setAttribute("code", code);
        boolean sendMSM = SendSMSUtils.sendMSM(tel,String.valueOf(code));
        return true;
    }
    @ResponseBody
    @RequestMapping("zhuce")
    public boolean zhuce(String tel,String password){
        boolean zhuce = userService.zhuce(tel, password);
        return true;
    }
}
