package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.IntegeralDao;
import com.example.yuanbaodianfrontend.service.IntegeralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IntegeralServiceImpl implements IntegeralService {
    @Autowired
    private IntegeralDao integeralDao;
    @Override
    @Transactional
    public int ExchangeGifts(Integer userId, String itemDescription,Integer price) {
        int i = integeralDao.ExchangeGifts(userId, itemDescription, price);
        int i1 = integeralDao.UpdateIntegeral(userId, price);

        return i+i1;
    }
}
