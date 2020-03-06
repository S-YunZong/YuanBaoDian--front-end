package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.YbdUser;
import com.example.yuanbaodianfrontend.service.IntegeralService;
import com.example.yuanbaodianfrontend.utils.AsyncService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("Integeral")
public class IntegeralController {
    @Autowired
    private IntegeralService integeralService;
    @Resource
    private AsyncService asyncService;
    //兑换礼物
    @RequestMapping("ExchangeGifts")
    @ResponseBody
    public  boolean ExchangeGifts(String itemDescription, HttpSession session,Integer price){
        YbdUser user_session = (YbdUser) session.getAttribute("user_session");
        int b = integeralService.ExchangeGifts(user_session.getId(), itemDescription,price);
        YbdUser user= (YbdUser) session.getAttribute("user_session");
        asyncService.INSLOG("添加","积分礼物",user.getId());//日志录入
        return true;
    }
}
