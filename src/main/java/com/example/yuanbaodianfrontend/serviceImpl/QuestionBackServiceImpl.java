package com.example.yuanbaodianfrontend.serviceImpl;

import com.example.yuanbaodianfrontend.dao.QuestionBackDao;
import com.example.yuanbaodianfrontend.pojo.QuestionVo;
import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import com.example.yuanbaodianfrontend.pojo.YbdQuestionBack;
import com.example.yuanbaodianfrontend.service.QuestionBackService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

    @Override
    public List<QuestionVo> MyMessage_2(Integer id) {
        return questionBackDao.MyMessage_2(id);
    }

    @Override
    public PageInfo<YbdQuestionBack> myFavorite(Integer pageNum, Integer pageSize, List<String> ybdQuestionBack_list) {
        if(ybdQuestionBack_list.size()>0){
            String infoIdStr=new String();
            for (int i=0;i<ybdQuestionBack_list.size();i++){
                infoIdStr += (ybdQuestionBack_list.get(i));
                infoIdStr += (",");
            }

            infoIdStr=infoIdStr.substring(0,infoIdStr.length()-1);
            PageHelper.startPage(pageNum, pageSize);
            List<YbdQuestionBack> list = questionBackDao.myFavorite(infoIdStr);

            PageInfo<YbdQuestionBack> p = new PageInfo<>(list);

            p.setTotal((int) p.getTotal());

            p.setList(p.getList());

            return p;
        }else {
            PageInfo<YbdQuestionBack> p = new PageInfo<>();
            return p;
        }



    }

    @Override
    public PageInfo<YbdQuestionBack> myCovenant(Integer pageNum, Integer pageSize, String id) {

        List<YbdQuestionBack> list = questionBackDao.myCovenant(id);
        if(list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                String errorOptionDescribe =questionBackDao.findError(list.get(i).getId(),list.get(i).getCreateUser());
                list.get(i).setErrorOptionDescribe(errorOptionDescribe);
            }

            PageHelper.startPage(pageNum, pageSize);

            PageInfo<YbdQuestionBack> p = new PageInfo<>(list);

            p.setTotal((int) p.getTotal());

            p.setList(p.getList());

            return p;
        }else{
            PageInfo<YbdQuestionBack> p = new PageInfo<>();
            return p;
        }

    }

    @Override
    public PageInfo<YbdExchanageMall> queryConvertRecord(Integer pageNum, Integer pageSize, String id) {

        List<YbdExchanageMall> list = questionBackDao.queryConvertRecord(id);

        PageHelper.startPage(pageNum, pageSize);

        PageInfo<YbdExchanageMall> p = new PageInfo<>(list);

        p.setTotal((int) p.getTotal());

        p.setList(p.getList());

        return p;
    }
}
