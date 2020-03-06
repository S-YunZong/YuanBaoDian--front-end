package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.YbdPicture;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import com.example.yuanbaodianfrontend.service.UserService;
import com.example.yuanbaodianfrontend.utils.AliyunOSSUtil;
import com.example.yuanbaodianfrontend.utils.AsyncService;
import com.example.yuanbaodianfrontend.utils.SendSms;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Resource
    private AsyncService asyncService;
    //发送验证码
    @RequestMapping("fasong")
    @ResponseBody
    public Integer fasong(String tel, HttpSession session){
        int code=(int)((Math.random()*9+1)*1000);
        session.setAttribute("code", code);
        boolean sendMSM = SendSms.sendMSM(tel,String.valueOf(code));
        if(sendMSM){
            return code;
        }
        return 0;
    }
    //注册
    @ResponseBody
    @RequestMapping("zhuce")
    public boolean zhuce(YbdUser user){
        boolean zhuce = userService.zhuce(user);
        return zhuce;
    }
    //登陆
    @RequestMapping("login")
    @ResponseBody
    public YbdUser login(String phone, String password,HttpSession session){
        YbdUser login = userService.login(phone, password);
        System.out.println(login);
            if (login!=null){
                session.setAttribute("user_session",login);
                asyncService.INSLOG("查询","登录",login.getId());//日志录入
                return login;
            }
        return login;
    }
    //退出
    @RequestMapping("LoginOut")
    @ResponseBody
    public boolean LoginOut(HttpSession session){
        YbdUser user= (YbdUser) session.getAttribute("user_session");
        asyncService.INSLOG("删除","退出",user.getId());//日志录入
        session.removeAttribute("user_session");
        return true;
    }
    //我的资料
    @RequestMapping("Personal")
    @ResponseBody
    public YbdUser Personal(Integer id,HttpSession session){
        YbdUser ybdUser=userService.Personal(id);
        YbdUser user= (YbdUser) session.getAttribute("user_session");
        asyncService.INSLOG("查询","我的资料",user.getId());//日志录入
        return ybdUser ;
    }
    //修改个人信息
    @ResponseBody
    @RequestMapping("update_Personal")
    public boolean update_Personal(MultipartFile file, Integer sex, Integer id, String userName)throws IOException {

        String filename = file.getOriginalFilename();
        if (!"".equals(filename.trim())) {
            File newFile = new File(filename);
            FileOutputStream os = new FileOutputStream(newFile);
            os.write(file.getBytes());
            os.close();
            file.transferTo(newFile);
            //上传到OSS
            String uploadUrl = AliyunOSSUtil.upload(newFile);
        }

        boolean update_personal = userService.update_Personal(sex, id, userName);
        if (update_personal==true){

            asyncService.INSLOG("修改","我的资料",id);//日志录入
            return true;
        }else {
            return false;
        }
    }

//    修改用户头像
    @ResponseBody
    @RequestMapping("update_Head")
    public boolean update_Head(MultipartFile file,Integer id)throws IOException {

        String filename = file.getOriginalFilename();

        boolean update_Head = false;
        if (!"".equals(filename.trim())) {
            File newFile = new File(filename);
            FileOutputStream os = new FileOutputStream(newFile);
            os.write(file.getBytes());
            os.close();
            file.transferTo(newFile);
            //上传到OSS
            String uploadUrl = AliyunOSSUtil.upload(newFile);
            update_Head = userService.update_Head(uploadUrl,id);
        }


        if (update_Head==true){
            asyncService.INSLOG("修改","用户头像",id);//日志录入
            return true;
        }else {
            return false;
        }
    }

    //修改密码
    @RequestMapping("updatePwd")
    @ResponseBody
    public boolean updatePwd(String password,HttpSession session){
        YbdUser a = (YbdUser)session.getAttribute("user_session");
       boolean b = userService.updatePwd(a.getPhone(),password);
        asyncService.INSLOG("修改","用户密码",a.getId());//日志录入
        return b;
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
        }else if(code1.equals(phoneText)){
            return true;
        }else {
            return false;
        }
    }
        //修改手机号
   @RequestMapping("updatePhone")
   @ResponseBody
    public boolean updateMobile(String newPhone,HttpSession session){
       YbdUser a = (YbdUser)session.getAttribute("user_session");
       boolean b = userService.updatePhone(newPhone,a.getId());
       asyncService.INSLOG("修改","手机号",a.getId());//日志录入
       return b;
    }


//    轮播图展示
    @RequestMapping("/rotationChart")
    @ResponseBody
    public List<YbdPicture> rotationChart(){

        List<YbdPicture> list = userService.rotationChart();

        return list;
    }

    /*查询答题排行*/
    @ResponseBody
    @RequestMapping("/queryUserListByQuestion")
    public List<YbdUser> queryUserListByQuestion(){
        List<YbdUser> list =userService.queryUserListByQuestion();
        return list;
    }

    /*查询准确率排行*/
    @ResponseBody
    @RequestMapping("/queryUserListByanswerRate")
    public List<YbdUser> queryUserListByanswerRate(){
        List<YbdUser> list =userService.queryUserListByanswerRate();
        return list;
    }

//    手机号校验
    @RequestMapping("/checkTel")
    @ResponseBody
    public boolean checkTel(String tel){
        boolean b = false;
        Integer checkTel = userService.checkTel(tel);
        if(checkTel==null){
            b=true;
        }
        return b;
    }
}
