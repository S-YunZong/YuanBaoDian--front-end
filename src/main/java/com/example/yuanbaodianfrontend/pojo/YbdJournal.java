package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class YbdJournal {
    private Integer id;

    private String remark;//操作

    private Date operationTime;//时间

    private String operationIp;//ip

    private String operationUser;//操作人

    private String operationType;

    private String incident;//具体内容

    private String frontback;//前后端

  }