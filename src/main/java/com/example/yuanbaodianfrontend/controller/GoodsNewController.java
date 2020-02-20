package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.service.GoodsNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("GoodsNew")
public class GoodsNewController {
    @Autowired
    private GoodsNewService goodsNewService;

    @RequestMapping("GoodsNew")
    @ResponseBody
    public List<YbdGoodnews> GoodsNew(){
        List<YbdGoodnews> ybdGoodnews = goodsNewService.GoodsNew();
        return ybdGoodnews;
    }
}
