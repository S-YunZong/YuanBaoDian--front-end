package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.UserDao;
import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdPicture;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import com.example.yuanbaodianfrontend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Transactional
    @Override
    public boolean zhuce(YbdUser user,String tel, String password) {
        boolean b=false;
        b=userDao.zhuce(tel,password);
        if(b=true){
            String s="http://kangkang666666.oss-cn-beijing.aliyuncs.com/oss/2020-03-02/47848259dc1843d781774962ac79d44d-11.jpg.png";
            b=userDao.insert_Head(s,user.getId());
        }
        return b;
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

    @Transactional
    @Override
    public boolean update_Head(String uploadUrl, Integer id) {

//        根据id删除用户头像
        boolean b1=userDao.delete_Head(id);
        boolean b=false;
        if(b1=true){
             b=userDao.insert_Head(uploadUrl,id);
        }

        return b;
    }

    @Override
    public int updatePhone(String newPhone, Integer id) {
        return 0;
    }

    @Override
    public int updatePwd(String phone, String password) {
        return 0;
    }


}
