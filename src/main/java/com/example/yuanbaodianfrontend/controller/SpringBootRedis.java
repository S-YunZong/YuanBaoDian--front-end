package com.example.yuanbaodianfrontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * \* User: 智慧
 * \* Date: 2019/11/28
 * \* Time: 18:24
 * \* 模块:
 * \
 */
@RequestMapping("redis")
@Controller
public class SpringBootRedis {

    @Autowired
    private RedisTemplate redisTemplate;


    //添加收藏
    @RequestMapping("COLLECT_addlist")
    @ResponseBody
    public boolean addlist(Integer questionBack_id,String phone) {
        String KEY = "COLLECT_" + phone;
        String hid = String.valueOf(questionBack_id);
        ListOperations<String, String> ops = redisTemplate.opsForList();
        long c = ops.leftPush(KEY, hid);
        List s = ops.range(KEY, 0, ops.size(hid));
        for (int i = 0; i < s.size(); i++) {
            String o = (String) s.get(i);
            if (hid.equals(o)) {
                return true;
            }
        }
        return false;
    }

    //删除收藏
    @RequestMapping("COLLECT_dellist")
    @ResponseBody
    public boolean dellist(Integer questionBack_id,String phone) {
        String hid = String.valueOf(questionBack_id);
        String KEY = "COLLECT_" + phone;
        ListOperations<String, String> ops = redisTemplate.opsForList();
        long l = ops.remove(KEY, 0, questionBack_id.toString());
        List s = ops.range(KEY, 0, -1);
        int sid = s.size();
        if (sid == 0) {
            return true;
        }
        for (int i = 0; i < s.size(); i++) {
            String o = (String) s.get(i);
            if (!hid.equals(o)) {
                return true;
            }
        }
        return false;
    }

    //查询收藏
    @RequestMapping("COLLECT_Alllist")
    @ResponseBody
    public boolean Alllist(Integer questionBack_id,String phone) {
        String hid = String.valueOf(questionBack_id);
        String KEY = "COLLECT_" + phone;
        ListOperations<String, String> ops = redisTemplate.opsForList();
        List v = ops.range(KEY, 0, -1);
        for (int i = 0; i < v.size(); i++) {
            String o = (String) v.get(i);
            if (hid.equals(o)) {
                return true;
            }
        }
        return false;
    }
    //添加选项记录
    @RequestMapping("RECORD_addHash")
    @ResponseBody
    public boolean addHash(String phone,String questionBack_id,String zixuan,String answer){
        String KEY = "RECORD_" + phone;
        HashOperations hash=redisTemplate.opsForHash();
        hash.put(KEY,questionBack_id,questionBack_id+","+answer+","+zixuan);
        boolean bo=hash.hasKey(KEY,questionBack_id);
        return bo;
    }
    /*查看选项记录*/
    @RequestMapping("RECORD_allHash")
    @ResponseBody
    public List allHash(String phone){
        String KEY = "RECORD_" + phone;
        HashOperations hash=redisTemplate.opsForHash();
        List t=hash.values(KEY);
        if(t.size()==0){
            return t;
        }else {
            return t;
        }
    }
}
