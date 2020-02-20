package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.MoNiKaoShiDao;
import com.example.yuanbaodianfrontend.pojo.LimitVo;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionType;
import com.example.yuanbaodianfrontend.service.MoNiKaoShiService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
        System.out.println("service1:"+questionTypeId);
        PageHelper.offsetPage(page.getOffset(), page.getLimit());
        System.out.println("service2:"+questionTypeId);
        List<YbdQuestionBack> list = moNiKaoShiDao.listYbdQuestionBack(questionTypeId);
        PageInfo<YbdQuestionBack> info = new PageInfo<>(list);
        page.setTotal(Integer.valueOf(String.valueOf(info.getTotal())));
        page.setRows(info.getList());
    }
}
