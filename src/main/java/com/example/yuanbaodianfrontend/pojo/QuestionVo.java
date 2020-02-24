package com.example.yuanbaodianfrontend.pojo;

import java.util.Date;

public class QuestionVo {
    private Integer PutQuestionsToId;
    private Integer objectUserId;
    private Integer startUserId;
    private Integer questionBackId;
    private String description;

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

    public Integer getPutQuestionsToId() {
        return PutQuestionsToId;
    }

    public void setPutQuestionsToId(Integer putQuestionsToId) {
        PutQuestionsToId = putQuestionsToId;
    }

    public Integer getObjectUserId() {
        return objectUserId;
    }

    public void setObjectUserId(Integer objectUserId) {
        this.objectUserId = objectUserId;
    }

    public Integer getStartUserId() {
        return startUserId;
    }

    public void setStartUserId(Integer startUserId) {
        this.startUserId = startUserId;
    }

    public Integer getQuestionBackId() {
        return questionBackId;
    }

    public void setQuestionBackId(Integer questionBackId) {
        this.questionBackId = questionBackId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestionBack() {
        return questionBack;
    }

    public void setQuestionBack(String questionBack) {
        this.questionBack = questionBack;
    }

    public Integer getAnswer() {
        return answer;
    }

    public void setAnswer(Integer answer) {
        this.answer = answer;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public Integer getGameLevelId() {
        return gameLevelId;
    }

    public void setGameLevelId(Integer gameLevelId) {
        this.gameLevelId = gameLevelId;
    }

    public Integer getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(Integer difficulty) {
        this.difficulty = difficulty;
    }

    public Integer getQuestionTypeId() {
        return questionTypeId;
    }

    public void setQuestionTypeId(Integer questionTypeId) {
        this.questionTypeId = questionTypeId;
    }

    public Integer getDisable() {
        return disable;
    }

    public void setDisable(Integer disable) {
        this.disable = disable;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
