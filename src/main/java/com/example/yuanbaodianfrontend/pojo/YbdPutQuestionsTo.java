package com.example.yuanbaodianfrontend.pojo;


public class YbdPutQuestionsTo {

    private Integer id;
    private Integer objectUserId;
    private Integer startUserId;
    private Integer questionBackId;
    private String description;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
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
}
