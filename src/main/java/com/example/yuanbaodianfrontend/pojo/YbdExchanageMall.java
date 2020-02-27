package com.example.yuanbaodianfrontend.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class YbdExchanageMall {

  private Integer id;
  private String itemDescription;
  private Integer price;
  private Integer inventory;
  private String itemPic;

  @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date convertTime;

  public Date getConvertTime() {
    return convertTime;
  }

  public void setConvertTime(Date convertTime) {
    this.convertTime = convertTime;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getItemDescription() {
    return itemDescription;
  }

  public void setItemDescription(String itemDescription) {
    this.itemDescription = itemDescription;
  }

  public Integer getPrice() {
    return price;
  }

  public void setPrice(Integer price) {
    this.price = price;
  }

  public Integer getInventory() {
    return inventory;
  }

  public void setInventory(Integer inventory) {
    this.inventory = inventory;
  }

  public String getItemPic() {
    return itemPic;
  }

  public void setItemPic(String itemPic) {
    this.itemPic = itemPic;
  }
}
