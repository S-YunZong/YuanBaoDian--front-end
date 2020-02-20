package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

@Data
public class YbdQuestionBackOption {
    private Integer id;

    private Integer questionBackId;//题目id

    private Integer option;//选项

    private String optionDescribe;//选项描述
}