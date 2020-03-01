package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

@Data
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
  private Integer pictureId;//图片id
  private String pictureType;//图片类型
  private String pictureUrl;//图片url
  private Integer pserId;//用户id

  private Integer questionNum;//答题数
  private Integer answerRate;//准确率
  }
