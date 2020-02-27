package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

import java.util.List;

/**
 * @author 23815
 * @create 2019-03-27 9:50
 * @desc 分业
 **/
@Data
public class LimitVo {
    private Integer id;
    private Integer limit;//每页显示数量
    private Integer offset;//当前页数
    private String sort;
    private String order;
    private int total;//总页数
    private List rows;
    private int[] timuid;

}
