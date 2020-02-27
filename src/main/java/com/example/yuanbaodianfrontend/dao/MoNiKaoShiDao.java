package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * 模拟考试
 * */
public interface MoNiKaoShiDao {
    //查看题目类型
    List<YbdQuestionType> selYbdQuestionType();
    //学前教育查询
    List<YbdQuestionBack> listYbdQuestionBack(int questionTypeId);
    int[] listYbdQuestionBackid(int questionTypeId);
    //查询章节
    List<YbdChapter> listYbdChapter();
    //查询关卡
    List<YbdGameLevel> listYbdGameLevel(int id);
    //提交疑问
    boolean insYbdPutQuestionsTo(@Param("QuestionsTo") YbdPutQuestionsTo QuestionsTo);
    //闯关查询
    List<YbdQuestionBack> chuangguanYbdQuestionBack(@Param("questionTypeId") int questionTypeId,@Param("gameLevelId") int gameLevelId);
    int[] chuangguanYbdQuestionBackid(@Param("questionTypeId") int questionTypeId,@Param("gameLevelId") int gameLevelId);
    //添加错题
    boolean insYbdWrongTopicRecord(@Param("ybdWrongTopicRecord") YbdWrongTopicRecord ybdWrongTopicRecord);
}
