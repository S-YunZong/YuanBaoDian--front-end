package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.*;
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
    //查询章节
    @RequestMapping("ybdChapterList")
    @ResponseBody
    public List<YbdChapter> ybdChapterList(){
        List<YbdChapter> list=moNiKaoShiService.listYbdChapter();
        return list;
    }
    //查询关卡
    @RequestMapping("ybdGameLevelList")
    @ResponseBody
    public List<YbdGameLevel> ybdGameLevelList(Integer id){
        List<YbdGameLevel> list=moNiKaoShiService.listYbdGameLevel(id);
        return list;
    }
    /*提出疑问*/
    @RequestMapping("insYbdPutQuestionsTo")
    @ResponseBody
    public boolean insYbdPutQuestionsTo(YbdPutQuestionsTo QuestionsTo){
        boolean bo=moNiKaoShiService.insYbdPutQuestionsTo(QuestionsTo);
        return bo;
    }
    //查询闯关题目
    @RequestMapping("chuangYbdQuestionBack")
    @ResponseBody
    public LimitVo chuangYbdQuestionBack(LimitVo page,Integer questionTypeId,Integer gameLevelId){
        moNiKaoShiService.chuangguanYbdQuestionBack(page,questionTypeId,gameLevelId);
        return page;
    }
}
