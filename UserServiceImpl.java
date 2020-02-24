package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.UserDao;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import com.example.yuanbaodianfrontend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public boolean zhuce(String tel, String password) {

        return userDao.zhuce(tel,password);
    }

    @Override
    public YbdUser login(String phone, String password) {
        return userDao.login(phone,password);
    }

    @Override
    public YbdUser Personal(Integer id) {
        return userDao.Personal (id);
    }

    @Override
    public boolean update_Personal(Integer sex, Integer id, String userName) {
        return userDao.update_Personal(sex,id,userName);
    }

    @Override
    public int updatePwd(String telephone, String password) {
        return userDao.updatePwd(telephone,password);
    }

    @Override
    public int updatePhone(String newPhone, Integer id) {
        return userDao.updatePhone(newPhone,id);
    }

}
