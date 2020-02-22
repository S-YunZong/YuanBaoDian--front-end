package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

@Data
public class YbdGameLevel {
    private Integer id;

    private Integer gameLevelId;//id

    private String gameLevelName;//关卡名称

    private String gemeLevelDescribe;//描述

    private Integer questionNumber;//题目数量

    private Integer chapterId;//所属章节id

    private Integer chapterSerialNumber;//编号

   }