package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.GoodsNewDao;
import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.service.GoodsNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsNewServiceImpl implements GoodsNewService {
    @Autowired
    private GoodsNewDao goodsNewDao;
    @Override
    public List<YbdGoodnews> GoodsNew() {
        return goodsNewDao.GoodsNew();
    }
}
