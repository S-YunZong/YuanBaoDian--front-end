package com.example.yuanbaodianfrontend.pojo;

import java.util.Date;

public class YbdWrongTopicRecord {
    private Integer id;

    private Integer questionBackId;//题目id

    private Integer userId;//用户id

    private Date createTime;//当前时间

    private String errorOption;//错误选项

    private Integer answerRecordId;//答题记录

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuestionBackId() {
        return questionBackId;
    }

    public void setQuestionBackId(Integer questionBackId) {
        this.questionBackId = questionBackId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getErrorOption() {
        return errorOption;
    }

    public void setErrorOption(String errorOption) {
        this.errorOption = errorOption == null ? null : errorOption.trim();
    }

    public Integer getAnswerRecordId() {
        return answerRecordId;
    }

    public void setAnswerRecordId(Integer answerRecordId) {
        this.answerRecordId = answerRecordId;
    }
}