package com.example.yuanbaodianfrontend.utils;

import com.example.yuanbaodianfrontend.dao.UserDao;
import com.example.yuanbaodianfrontend.pojo.YbdUser;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;

/**
 * \* User: 智慧
 * \* Date: 2019/12/14
 * \* Time: 11:45
 * \* 模块:
 * \
 */
@Component
public class AsyncService {
    @Resource
    private UserDao userDao;

    @Async//告诉spring这是一个异步方法
    public void INSLOG(String remark, String incident,Integer userid) {
        if (userid != null) {
            System.out.println("异步加载日志启动");
            try {
                InetAddress address = InetAddress.getLocalHost();//获取的是本地的IP地址 //PC-20140317PXKX/192.168.0.121
                String hostAddress = address.getHostAddress();
                boolean b;
                /*Thread.sleep(5000);*///睡眠5秒
                b = userDao.YbdJournal(remark,hostAddress, String.valueOf(userid),incident,"1");
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("异步加载日志完毕");
        } else {

        }
    }
}
