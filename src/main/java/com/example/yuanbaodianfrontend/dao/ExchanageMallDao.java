package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ExchanageMallDao {
    //查看商城
    List<YbdExchanageMall> SelectExchanageMall();
}
