package com.example.yuanbaodianfrontend.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    boolean zhuce (@Param("tel") String tel, @Param("password") String password);

}
