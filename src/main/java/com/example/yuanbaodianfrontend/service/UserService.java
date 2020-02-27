package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {
    boolean zhuce (String tel,String password);
    YbdUser login(String phone , String password);

    YbdUser Personal(Integer id);

    boolean update_Personal(Integer sex, Integer id, String userName);

    int updatePwd(String telephone, String password);

    int updatePhone(String newPhone, Integer id);
}
