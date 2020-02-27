package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    //注册
    boolean zhuce (@Param("tel") String tel, @Param("password") String password);
    //登陆
    YbdUser login(@Param("phone")String phone , @Param("password") String password);
    //个人信息
    YbdUser Personal(Integer id);
    //修改个人信息
    boolean update_Personal(@Param("sex") Integer sex, @Param("id") Integer id, @Param("userName") String userName);
    //修改密码
    int updatePwd(@Param("telephone") String telephone, @Param("password")String password);
    //修改手机号
    int updatePhone(@Param("newPhone") String newPhone, @Param("id")Integer id);
}
