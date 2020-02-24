package com.example.yuanbaodianfrontend.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


public interface IntegeralService {
    //兑换礼物
     int  ExchangeGifts(Integer userId, String itemDescription,Integer price);



}
