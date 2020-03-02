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
    //习题查询
    List<YbdQuestionBack> listYbdQuestionBack(int questionTypeId);
    //查询题目id
    int[] listYbdQuestionBackid(int questionTypeId);
    //查询章节
    List<YbdChapter> listYbdChapter();
    //查询关卡
    List<YbdGameLevel> listYbdGameLevel(int id);
    //提交疑问
    boolean insYbdPutQuestionsTo(@Param("QuestionsTo") YbdPutQuestionsTo QuestionsTo);
    //闯关查询
    List<YbdQuestionBack> chuangguanYbdQuestionBack(@Param("questionTypeId") int questionTypeId,@Param("gameLevelId") int gameLevelId);
    //查询闯关题目id
    int[] chuangguanYbdQuestionBackid(@Param("questionTypeId") int questionTypeId,@Param("gameLevelId") int gameLevelId);
    //添加错题
    boolean insYbdWrongTopicRecord(@Param("ybdWrongTopicRecord") YbdWrongTopicRecord ybdWrongTopicRecord);
    //查询当前用户的关卡进度
    YbdUserAnswerRecord selYbdUserAnswerRecord(int id);
    //获取用户积分
    int selintegral(int id);
    //修改用户积分
    boolean updintegral(@Param("id") int id,@Param("integral") int integral);
    //修改真题题库状态
    boolean updzhanti(int id);
    //添加学习进度
    boolean addYbdUserAnswerRecord(int id);
    //修改学习进度
    boolean updYbdUserAnswerRecord(@Param("id") int id,@Param("chapterSerialNumber") int chapterSerialNumber);
}
