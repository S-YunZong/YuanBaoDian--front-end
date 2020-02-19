package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.UserDao;
import com.example.yuanbaodianfrontend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public boolean zhuce(String tel, String password) {

        return userDao.zhuce(tel,password);
    }

    @Override
    public boolean login(String phone, String password) {
        return userDao.login(phone,password);
    }
}
