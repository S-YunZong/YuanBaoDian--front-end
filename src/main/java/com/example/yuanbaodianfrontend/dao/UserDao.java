package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdPicture;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    //注册
    boolean zhuce (YbdUser user);
    //登陆
    YbdUser login(@Param("phone")String phone , @Param("password") String password);
    //个人信息
    YbdUser Personal(Integer id);
    //修改个人信息
    boolean update_Personal(@Param("sex") Integer sex, @Param("id") Integer id, @Param("userName") String userName);
    //轮播图展示
    List<YbdPicture> rotationChart();
    //答题排行榜数据
    List<YbdUser> queryUserListByQuestion();
    //准确率排行榜数据
    List<YbdUser> queryUserListByanswerRate();
    //根据id删除用户头像
    boolean delete_Head(Integer id);
    //根据id添加用户头像
    boolean insert_Head(@Param("uploadUrl") String uploadUrl,@Param("id") Integer id);
    //修改手机号
    boolean updatePhone(@Param("newPhone")String newPhone,@Param("id") Integer id);
    //修改密码
    boolean updatePwd(@Param("phone")String phone,@Param("password") String password);
    //手机号校验
    Integer checkTel(String tel);
}
