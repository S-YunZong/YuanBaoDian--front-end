package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.LimitVo;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionType;
import com.example.yuanbaodianfrontend.service.MoNiKaoShiService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * \* User: 智慧
 * \* Date: 2020/2/18
 * \* Time: 17:27
 * \* 模块:模拟考试
 * \
 */
@RequestMapping("user")
@Controller
public class MoNiKaoShiController {
    @Resource
    private MoNiKaoShiService moNiKaoShiService;

    //查询题目类型
    @ResponseBody
    @RequestMapping("selYbdQuestionType")
    public List<YbdQuestionType> selYbdQuestionType(){
        List<YbdQuestionType> list=moNiKaoShiService.selYbdQuestionType();
        return list;
    }
    //查询题目
    @RequestMapping("listYbdQuestionBack")
    @ResponseBody
    public LimitVo listYbdQuestionBack(LimitVo page,Integer questionTypeId){
        moNiKaoShiService.listYbdQuestionBack(page,questionTypeId);
        return page;
    }
}
