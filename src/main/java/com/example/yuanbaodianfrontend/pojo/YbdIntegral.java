package com.example.yuanbaodianfrontend.pojo;


import java.util.Date;

public class YbdIntegral {

  private Integer id;
  private Date operationTime;
  private String integralOperation;
  private String quantizationIntegralOperation;
  private Integer objectUserId;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Date getOperationTime() {
    return operationTime;
  }

  public void setOperationTime(Date operationTime) {
    this.operationTime = operationTime;
  }

  public String getIntegralOperation() {
    return integralOperation;
  }

  public void setIntegralOperation(String integralOperation) {
    this.integralOperation = integralOperation;
  }

  public String getQuantizationIntegralOperation() {
    return quantizationIntegralOperation;
  }

  public void setQuantizationIntegralOperation(String quantizationIntegralOperation) {
    this.quantizationIntegralOperation = quantizationIntegralOperation;
  }

  public Integer getObjectUserId() {
    return objectUserId;
  }

  public void setObjectUserId(Integer objectUserId) {
    this.objectUserId = objectUserId;
  }
}
