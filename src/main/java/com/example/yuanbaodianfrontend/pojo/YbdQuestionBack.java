package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class YbdQuestionBack {
    private Integer id;

    private String questionBack;//题目

    private Integer answer;//正确答案

    private Date createtime;//创建时间

    private Integer createUser;//出题人

    private Integer gameLevelId;//所属关卡id

    private Integer difficulty;//难度

    private Integer questionTypeId;//题目类型id

    private Integer disable;//状态

    private String analysis;//解析

    private String userName;//出题人姓名

    List<YbdQuestionBackOption> optionList;

    }