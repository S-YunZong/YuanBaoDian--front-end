package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.UserDao;
import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdPicture;
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
    public List<YbdPicture> rotationChart() {
        return userDao.rotationChart();
    }

    @Override
    public List<YbdUser> queryUserListByQuestion() {
        return userDao.queryUserListByQuestion();
    }

    @Override
    public List<YbdUser> queryUserListByanswerRate() {
        return userDao.queryUserListByanswerRate();
    }

    @Override
    public boolean update_Head(String uploadUrl, Integer id) {

//        根据id删除用户头像
        boolean b1=userDao.delete_Head(id);
        boolean b=false;
        if(b1){
             b=userDao.insert_Head(uploadUrl,id);
        }else{
            return b;
        }

        return b;
    }


}
