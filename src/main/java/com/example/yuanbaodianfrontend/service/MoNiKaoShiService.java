package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoNiKaoShiService {
    //查看题目类型
    List<YbdQuestionType> selYbdQuestionType();
    //题库
    void listYbdQuestionBack(LimitVo page,int questionTypeId);
    //题库
    void listYbdQuestionBack2(LimitVo page,int questionTypeId,String[] gjz);
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
    //查询当前用户的关卡进度
    YbdUserAnswerRecord selYbdUserAnswerRecord(int id);
    //获取用户积分
    int selintegral(int id);
    //修改用户积分
    boolean updintegral(@Param("id") int id,@Param("integral") int integral,int chapterSerialNumber);
    //添加学习进度
    boolean addYbdUserAnswerRecord(int id);
    //修改真题题库状态
    boolean updzhanti(int id);
    //查询关键词
    List<YbdQuestionBackKeyword> selYbdQuestionBackKeyword();

}
