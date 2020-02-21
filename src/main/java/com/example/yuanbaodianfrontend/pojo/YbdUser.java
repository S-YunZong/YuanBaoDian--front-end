package com.example.yuanbaodianfrontend.pojo;


public class YbdUser {

  private Integer id; //主键
  private String userName;//姓名
  private String password;//密码
  private Integer sex;//性别
  private String phone;//电话
  private String email;//邮箱
  private Integer integral;//积分
  private Integer quantizationIntegral;//量化积分
  private String position;//职位

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

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public Integer getIntegral() {
    return integral;
  }

  public void setIntegral(Integer integral) {
    this.integral = integral;
  }

  public Integer getQuantizationIntegral() {
    return quantizationIntegral;
  }

  public void setQuantizationIntegral(Integer quantizationIntegral) {
    this.quantizationIntegral = quantizationIntegral;
  }

  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }
}
