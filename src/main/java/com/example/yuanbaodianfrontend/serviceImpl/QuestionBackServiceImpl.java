package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.QuestionBackDao;
import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import com.example.yuanbaodianfrontend.service.QuestionBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Action;
import java.util.List;

@Service
public class QuestionBackServiceImpl implements QuestionBackService {
    @Autowired
    private QuestionBackDao questionBackDao;

    @Override
    public List<QuestionVo> MyMessage() {
        return questionBackDao.MyMessage();
    }
}
