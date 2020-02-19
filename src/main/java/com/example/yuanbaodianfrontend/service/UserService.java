package com.example.yuanbaodianfrontend.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;


public interface UserService {
    boolean zhuce (String tel,String password);
    boolean login(String phone , String password);

}
