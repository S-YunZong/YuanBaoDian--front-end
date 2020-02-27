package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.MoNiKaoShiDao;
import com.example.yuanbaodianfrontend.pojo.*;
import com.example.yuanbaodianfrontend.service.MoNiKaoShiService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * \* User: 智慧
 * \* Date: 2020/2/18
 * \* Time: 17:24
 * \* 模块:模拟考试
 * \
 */
@Service
public class MoNiKaoShiServiceImpl implements MoNiKaoShiService {
    @Resource
    private MoNiKaoShiDao moNiKaoShiDao;
    @Override
    public List<YbdQuestionType> selYbdQuestionType() {
        return moNiKaoShiDao.selYbdQuestionType();
    }

    @Override
    public void listYbdQuestionBack(LimitVo page,int questionTypeId) {
        int[] s=moNiKaoShiDao.listYbdQuestionBackid(questionTypeId);
        PageHelper.offsetPage(page.getOffset(), page.getLimit());
        List<YbdQuestionBack> list = moNiKaoShiDao.listYbdQuestionBack(questionTypeId);
        page.setTimuid(s);
        PageInfo<YbdQuestionBack> info = new PageInfo<>(list);
        page.setTotal(Integer.valueOf(String.valueOf(info.getTotal())));
        page.setRows(info.getList());
    }

    @Override
    public List<YbdChapter> listYbdChapter() {
        return moNiKaoShiDao.listYbdChapter();
    }

    @Override
    public List<YbdGameLevel> listYbdGameLevel(int id) {
        return moNiKaoShiDao.listYbdGameLevel(id);
    }

    @Override
    public boolean insYbdPutQuestionsTo(YbdPutQuestionsTo QuestionsTo) {
        return moNiKaoShiDao.insYbdPutQuestionsTo(QuestionsTo);
    }

    @Override
    public void chuangguanYbdQuestionBack(LimitVo page, int questionTypeId, int gameLevelId) {
        int s[]=moNiKaoShiDao.chuangguanYbdQuestionBackid(questionTypeId,gameLevelId);
        PageHelper.offsetPage(page.getOffset(), page.getLimit());
        List<YbdQuestionBack> list = moNiKaoShiDao.chuangguanYbdQuestionBack(questionTypeId,gameLevelId);
        page.setTimuid(s);
        PageInfo<YbdQuestionBack> info = new PageInfo<>(list);
        page.setTotal(Integer.valueOf(String.valueOf(info.getTotal())));
        page.setRows(info.getList());
    }

    @Override
    public boolean insYbdWrongTopicRecord(YbdWrongTopicRecord ybdWrongTopicRecord) {
        return moNiKaoShiDao.insYbdWrongTopicRecord(ybdWrongTopicRecord);
    }
}
