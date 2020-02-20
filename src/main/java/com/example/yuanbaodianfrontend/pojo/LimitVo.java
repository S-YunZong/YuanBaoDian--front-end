package com.example.yuanbaodianfrontend.pojo;

import java.util.List;

/**
 * @author 23815
 * @create 2019-03-27 9:50
 * @desc 分业
 **/
public class LimitVo {
    private Integer id;
    private Integer limit;//每页显示数量
    private Integer offset;//当前页数
    private String sort;
    private String order;
    private int total;//总页数
    private List rows;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public Integer getLimit() {
        return limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public String getSort() {
        return sort;
    }

    public String getOrder() {
        return order;
    }

    public int getTotal() {
        return total;
    }

    public List getRows() {
        return rows;
    }
}
