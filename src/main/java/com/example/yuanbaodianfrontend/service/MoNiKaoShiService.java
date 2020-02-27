package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoNiKaoShiService {
    //查看题目类型
    List<YbdQuestionType> selYbdQuestionType();
    //题库
    void listYbdQuestionBack(LimitVo page,int questionTypeId);
    //查询章节
    List<YbdChapter> listYbdChapter();
    //查询关卡
    List<YbdGameLevel> listYbdGameLevel(int id);
    //提交疑问
    boolean insYbdPutQuestionsTo(YbdPutQuestionsTo QuestionsTo);
    //闯关题库
    void chuangguanYbdQuestionBack(LimitVo page,int questionTypeId,int gameLevelId);
    //添加错题
    boolean insYbdWrongTopicRecord(@Param("ybdWrongTopicRecord") YbdWrongTopicRecord ybdWrongTopicRecord);

}
