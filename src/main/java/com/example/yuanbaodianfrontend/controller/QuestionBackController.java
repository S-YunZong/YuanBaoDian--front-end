package com.example.yuanbaodianfrontend.controller;

import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import com.example.yuanbaodianfrontend.service.QuestionBackService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("QuestionBack")
public class QuestionBackController {
    @Autowired
    private QuestionBackService questionBackService;

    @Autowired
    private RedisTemplate redisTemplate;

    //我的消息
    @RequestMapping("MyMessage")
    @ResponseBody
    public List<QuestionVo> MyMessage(){
        List<QuestionVo> questionVos=questionBackService.MyMessage();
        return  questionVos;
    }
    //消息详情

    @RequestMapping("MyMessage_2")
    @ResponseBody
    public List<QuestionVo> MyMessage_2(Integer id){
        List<QuestionVo> v=   questionBackService.MyMessage_2(id);
        return  v;
    }

//    我的收藏
    @RequestMapping("/myFavorite")
    @ResponseBody
    public PageInfo<YbdQuestionBack> myFavorite(Integer sign,String phone, Integer pageNum, Integer pageSize){

        if(pageNum==null){
            pageNum=1;
        }
        if(pageSize==null){
            pageSize=5;
        }

        ListOperations<String,String> ops=redisTemplate.opsForList();
        //拼接redis中的key
        String KEY = "COLLECT_" + phone;
        //获取key中所有值
        List<String> YbdQuestionBack_list = new ArrayList<>();
        if(sign==0){
//            我的收藏数据源
             YbdQuestionBack_list=ops.range(KEY,0,-1);
        }else{
//            最近收藏数据源
             YbdQuestionBack_list=ops.range(KEY,0,2);
        }


        PageInfo<YbdQuestionBack> list = questionBackService.myFavorite(pageNum,pageSize,YbdQuestionBack_list);



        return list;
    }


//    我的错题
    @RequestMapping("/myCovenant")
    @ResponseBody
    public PageInfo<YbdQuestionBack> myCovenant(String id, Integer pageNum, Integer pageSize){

        if(pageNum==null){
            pageNum=1;
        }
        if(pageSize==null){
            pageSize=5;
        }

        PageInfo<YbdQuestionBack> list = questionBackService.myCovenant(pageNum,pageSize,id);

        return list;
    }

//    查询我的礼物
    @RequestMapping("/queryConvertRecord")
    @ResponseBody
    public PageInfo<YbdExchanageMall> queryConvertRecord(String id, Integer pageNum, Integer pageSize){

        if(pageNum==null){
            pageNum=1;
        }
        if(pageSize==null){
            pageSize=5;
        }

        PageInfo<YbdExchanageMall> list = questionBackService.queryConvertRecord(pageNum,pageSize,id);

        return list;
    }

    //首页我的礼物
    @RequestMapping("/queryConvertRecord2")
    @ResponseBody
    public List<YbdExchanageMall> queryConvertRecord2(String id){

        List<YbdExchanageMall> list = questionBackService.queryConvertRecord2(id);

        return list;
    }

//    查询积分记录
    @RequestMapping("/myContract")
    @ResponseBody
    public PageInfo<YbdExchanageMall> myContract(String id, Integer pageNum, Integer pageSize){

        if(pageNum==null){
            pageNum=1;
        }
        if(pageSize==null){
            pageSize=5;
        }

        PageInfo<YbdExchanageMall> list = questionBackService.myContract(pageNum,pageSize,id);

        return list;
    }
}
