package com.example.yuanbaodianfrontend.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class YbdGoodnews {

  private Integer id;//主键
  private String userName;//姓名
  private Integer sex;//性别
  private Integer age;//年龄
  private String email;//邮箱
  private String phone;//手机号
  @JsonFormat(pattern="yyyy.MM.dd", timezone="GMT+8")
  @DateTimeFormat(pattern="yyyy.MM.dd")
  private Date entrytime;//入职时间
  private String entrycompany;//入职公司
  private String salary;//薪资
  private String treatment;//待遇
  private Integer disabled;//
  private String personalPic;//个人照片

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public Integer getAge() {
    return age;
  }

  public void setAge(Integer age) {
    this.age = age;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public Date getEntrytime() {
    return entrytime;
  }

  public void setEntrytime(Date entrytime) {
    this.entrytime = entrytime;
  }

  public String getEntrycompany() {
    return entrycompany;
  }

  public void setEntrycompany(String entrycompany) {
    this.entrycompany = entrycompany;
  }

  public String getSalary() {
    return salary;
  }

  public void setSalary(String salary) {
    this.salary = salary;
  }

  public String getTreatment() {
    return treatment;
  }

  public void setTreatment(String treatment) {
    this.treatment = treatment;
  }

  public Integer getDisabled() {
    return disabled;
  }

  public void setDisabled(Integer disabled) {
    this.disabled = disabled;
  }

  public String getPersonalPic() {
    return personalPic;
  }

  public void setPersonalPic(String personalPic) {
    this.personalPic = personalPic;
  }
}
