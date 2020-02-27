package com.example.yuanbaodianfrontend.dao;

import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionBackDao {
    //我的消息
    List<QuestionVo> MyMessage();
    //消息详情
    List<QuestionVo> MyMessage_2(Integer id);
    //我的收藏
    List<YbdQuestionBack> myFavorite(@Param("infoIdStr") String infoIdStr);
    //我的错题
    List<YbdQuestionBack> myCovenant(String id);
    //查询错题选项
    String findError(@Param("id") Integer id,@Param("createUser") Integer createUser);
    //查询兑换记录
    List<YbdExchanageMall> queryConvertRecord(String id);
}
