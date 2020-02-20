package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    boolean zhuce (@Param("tel") String tel, @Param("password") String password);

    boolean login(@Param("phone")String phone ,@Param("password") String password);



}
