package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.*;
import com.example.yuanbaodianfrontend.service.MoNiKaoShiService;
import com.example.yuanbaodianfrontend.utils.AsyncService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
    @Resource
    private AsyncService asyncService;
    //查询题目类型
    @ResponseBody
    @RequestMapping("selYbdQuestionType")
    public List<YbdQuestionType> selYbdQuestionType(HttpSession session){
        List<YbdQuestionType> list=moNiKaoShiService.selYbdQuestionType();
        YbdUser user= (YbdUser) session.getAttribute("user_session");
        asyncService.INSLOG("查看","模拟考试",user.getId());//日志录入
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
    /*错题录入*/
    @RequestMapping("insYbdWrongTopicRecord")
    @ResponseBody
    public boolean insYbdWrongTopicRecord(YbdWrongTopicRecord ybdWrongTopicRecord){
        boolean boo=moNiKaoShiService.insYbdWrongTopicRecord(ybdWrongTopicRecord);
        return boo;
    }
    /*查询当前用户积分*/
    @RequestMapping("selintegral")
    @ResponseBody
    public int selintegral(Integer id){
        int integral=moNiKaoShiService.selintegral(id);
        return integral;
    }
    /*修改用户积分
    * 修改用户进度*/
    @RequestMapping("updintegral")
    @ResponseBody
    public boolean updintegral(Integer id,Integer integral,Integer chapterSerialNumber){
        boolean bo=moNiKaoShiService.updintegral(id,integral,chapterSerialNumber);
        asyncService.INSLOG("查看","模拟考试",id);//日志录入
        return bo;
    }
    /*查询用户学习进度*/
    @ResponseBody
    @RequestMapping("selYbdUserAnswerRecord")
    public YbdUserAnswerRecord selYbdUserAnswerRecord(Integer id){
        YbdUserAnswerRecord ss=moNiKaoShiService.selYbdUserAnswerRecord(id);
        return ss;
    }
    /*添加用户学习进度*/
    @ResponseBody
    @RequestMapping("addYbdUserAnswerRecord")
    public boolean addYbdUserAnswerRecord(Integer id){
        boolean b=moNiKaoShiService.addYbdUserAnswerRecord(id);
        return b;
    }
    //修改真题题库状态
    @ResponseBody
    @RequestMapping("updzhanti")
    public boolean updzhanti(Integer id){
        boolean b=moNiKaoShiService.updzhanti(id);
        return b;
    }
}
