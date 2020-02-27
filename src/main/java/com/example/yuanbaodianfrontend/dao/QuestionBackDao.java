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

    List<YbdQuestionBack> myFavorite(@Param("infoIdStr") String infoIdStr);

    List<YbdQuestionBack> myCovenant(String id);

    String findError(@Param("id") Integer id,@Param("createUser") Integer createUser);

    List<YbdExchanageMall> queryConvertRecord(String id);
}
