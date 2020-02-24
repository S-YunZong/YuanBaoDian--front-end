package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import com.example.yuanbaodianfrontend.service.ExchanageMallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("ExchanageMall")
public class ExchanageMallController {
    @Autowired
    private ExchanageMallService exchanageMallService;
    //查询商城
    @RequestMapping("SelectExchanageMall")
    @ResponseBody
    public List<YbdExchanageMall> SelectExchanageMall(){
        List<YbdExchanageMall> ybdExchanageMalls = exchanageMallService.SelectExchanageMall();
        return ybdExchanageMalls;
    }
}
