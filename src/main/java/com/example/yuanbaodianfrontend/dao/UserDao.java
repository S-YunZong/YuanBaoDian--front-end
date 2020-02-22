package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    boolean zhuce (@Param("tel") String tel, @Param("password") String password);

    YbdUser login(@Param("phone")String phone , @Param("password") String password);


    YbdUser Personal(Integer id);

    boolean update_Personal(@Param("sex") Integer sex, @Param("id") Integer id, @Param("userName") String userName);
}
