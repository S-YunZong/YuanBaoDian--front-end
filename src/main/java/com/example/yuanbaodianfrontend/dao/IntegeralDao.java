package com.example.yuanbaodianfrontend.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IntegeralDao {
    //兑换礼物
     int  ExchangeGifts(@Param("userId") Integer userId,@Param("itemDescription") String itemDescription,@Param("price") Integer price);
     //修改user量化积分
     int UpdateIntegeral(@Param("userId") Integer userId,@Param("price")Integer price);
}
