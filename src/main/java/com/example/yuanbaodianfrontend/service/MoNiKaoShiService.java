package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.LimitVo;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionType;

import java.util.List;

public interface MoNiKaoShiService {
    //查看题目类型
    List<YbdQuestionType> selYbdQuestionType();
    //题库
    void listYbdQuestionBack(LimitVo page,int questionTypeId);
}
