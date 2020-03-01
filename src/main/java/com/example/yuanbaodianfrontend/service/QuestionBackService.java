package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface QuestionBackService {
    List<QuestionVo> MyMessage();

    List<QuestionVo> MyMessage_2(Integer id);

    PageInfo<YbdQuestionBack> myFavorite(Integer pageNum, Integer pageSize, List<String> ybdQuestionBack_list);

    PageInfo<YbdQuestionBack> myCovenant(Integer pageNum, Integer pageSize, String id);

    PageInfo<YbdExchanageMall> queryConvertRecord(Integer pageNum, Integer pageSize, String id);

    List<YbdExchanageMall> queryConvertRecord2(String id);

    PageInfo<YbdExchanageMall> myContract(Integer pageNum, Integer pageSize, String id);
}
