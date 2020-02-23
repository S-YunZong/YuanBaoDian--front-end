package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import com.example.yuanbaodianfrontend.service.QuestionBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("QuestionBack")
public class QuestionBackController {
    @Autowired
    private QuestionBackService questionBackService;

    //我的消息
    @RequestMapping("MyMessage")
    @ResponseBody
    public List<QuestionVo> MyMessage(){
        List<QuestionVo> questionVos=questionBackService.MyMessage();
        return  questionVos;
    }
}
