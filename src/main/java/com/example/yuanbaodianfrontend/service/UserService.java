package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.YbdGoodnews;
import com.example.yuanbaodianfrontend.pojo.YbdPicture;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {
    boolean zhuce (YbdUser user);
    YbdUser login(String phone , String password);

    YbdUser Personal(Integer id);

    boolean update_Personal(Integer sex, Integer id, String userName);

    List<YbdPicture> rotationChart();

    List<YbdUser> queryUserListByQuestion();

    List<YbdUser> queryUserListByanswerRate();

    boolean update_Head(String uploadUrl, Integer id);
    //修改手机号
    boolean updatePhone(String newPhone, Integer id);
    //修改密码
    boolean updatePwd(String phone, String password);

    Integer checkTel(String tel);
}
