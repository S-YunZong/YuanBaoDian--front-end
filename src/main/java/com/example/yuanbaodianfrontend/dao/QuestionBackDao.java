package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionBackDao {
    //我的消息
    List<QuestionVo> MyMessage();
}
