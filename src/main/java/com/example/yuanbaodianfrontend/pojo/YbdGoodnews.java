package com.example.yuanbaodianfrontend.pojo;


import javax.xml.crypto.Data;

public class YbdGoodnews {

  private Integer id;
  private String userName;
  private Integer sex;
  private Integer age;
  private String email;
  private String phone;
  private Data entrytime;
  private String entrycompany;
  private String salary;
  private String treatment;
  private Integer disabled;
  private String personalPic;

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

  public Data getEntrytime() {
    return entrytime;
  }

  public void setEntrytime(Data entrytime) {
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