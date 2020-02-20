package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {
    boolean zhuce (String tel,String password);
    boolean login(String phone , String password);

}
