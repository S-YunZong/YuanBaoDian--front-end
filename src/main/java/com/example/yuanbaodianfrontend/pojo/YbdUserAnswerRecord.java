package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

@Data
public class YbdUserAnswerRecord {
    private Integer id;

    private Integer userId;//用户id

    private Integer chapterSerialNumber;//关卡

    private Integer realTopicStatus;//真题题库状态

}