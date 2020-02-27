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
    public YbdUser login(String phone, String password,HttpSession session){
        YbdUser login = userService.login(phone, password);
        System.out.println(login);
            if (login!=null){
                session.setAttribute("user_session",login);
                YbdUser user_session = (YbdUser) session.getAttribute("user_session");
                return login;
            }
        return login;
    }
    //退出
    @RequestMapping("LoginOut")
    @ResponseBody
    public boolean LoginOut(HttpSession session){
        session.removeAttribute("user_session");
        return true;
    }
    //我的资料
    @RequestMapping("Personal")
    @ResponseBody
    public YbdUser Personal(Integer id){
        YbdUser ybdUser=userService.Personal(id);
        return ybdUser ;
    }
    //修改个人信息
    @ResponseBody
    @RequestMapping("update_Personal")
    public boolean update_Personal(Integer sex,Integer id,String userName){
        boolean update_personal = userService.update_Personal(sex, id, userName);
        if (update_personal==true){
            return true;
        }else {
            return false;
        }
    }

    //修改密码
    @RequestMapping("updatePwd")
    @ResponseBody
    public boolean updatePwd(String telephone,String password){
       int i = userService.updatePwd(telephone,password);
        if(i>0) {
            return true;
       }else {
           return false;
        }
    }

    //获取验证码
    @RequestMapping("getMsg")
    @ResponseBody
    public boolean changePwd(HttpSession session){
        int code = (int) ((Math.random()*9+1)*1000);
        session.setAttribute("code", code);
        System.out.println(code);
        //boolean sendSMS = SendSMSUtils.sendMSM(user.getTel(),String.valueOf(code));
        return true;
    }

    //验证码校验
    @RequestMapping("checkPhoneText")
    @ResponseBody
    public boolean checkPhoneText(HttpSession session,Integer phoneText){
        Integer code1 = (Integer) session.getAttribute("code");
        if(null==code1) {
            return false;
        }else if(!code1.equals(phoneText)){
            return false;
        }
        return true;
    }
        //修改手机号
   @RequestMapping("updatePhone")
   @ResponseBody
    public boolean updateMobile(String newPhone,Integer id){
        int i = userService.updatePhone(newPhone,id);
       if(i>0) {
           return true;
       }else {
           return false;
        }
    }

}
