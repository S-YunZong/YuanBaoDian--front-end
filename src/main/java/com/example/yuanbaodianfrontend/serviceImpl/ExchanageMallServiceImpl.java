package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.ExchanageMallDao;
import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import com.example.yuanbaodianfrontend.service.ExchanageMallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExchanageMallServiceImpl implements ExchanageMallService {
    @Autowired
    private ExchanageMallDao exchanageMallDao;

    @Override
    public List<YbdExchanageMall> SelectExchanageMall() {
        return exchanageMallDao.SelectExchanageMall();
    }
}
