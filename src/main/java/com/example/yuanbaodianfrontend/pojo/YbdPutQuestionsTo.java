package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

@Data
public class YbdPutQuestionsTo {
    private Integer id;

    private Integer objectUserId;//被问者

    private Integer startUserId;//提问者

    private Integer questionBackId;//题目id

    private String description;//提问内容

    }
