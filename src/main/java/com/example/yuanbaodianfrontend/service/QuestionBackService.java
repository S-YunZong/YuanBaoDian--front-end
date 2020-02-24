package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface QuestionBackService {
    List<QuestionVo> MyMessage();

    List<QuestionVo> MyMessage_2(Integer id);
}
