package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdChapter;
import com.example.yuanbaodianfrontend.pojo.YbdGameLevel;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionType;

import java.util.List;
/**
 * 模拟考试
 * */
public interface MoNiKaoShiDao {
    //查看题目类型
    List<YbdQuestionType> selYbdQuestionType();
    //题库查询
    List<YbdQuestionBack> listYbdQuestionBack(int questionTypeId);
    //查询章节
    List<YbdChapter> listYbdChapter();
    //查询关卡
    List<YbdGameLevel> listYbdGameLevel(int id);
}
