package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsNewDao {
    List<YbdGoodnews> GoodsNew();
}
