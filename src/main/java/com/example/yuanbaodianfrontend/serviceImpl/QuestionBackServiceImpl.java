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

        //如果ybdQuestionBack_list里有值进行操作
        // 否则返回空集合
        if(ybdQuestionBack_list.size()>0){

            String infoIdStr=new String();

            //将ybdQuestionBack_list转换为 1，2，3，的形式
            for (int i=0;i<ybdQuestionBack_list.size();i++){
                infoIdStr += (ybdQuestionBack_list.get(i));
                infoIdStr += (",");
            }

            //截取最后一个，
            infoIdStr=infoIdStr.substring(0,infoIdStr.length()-1);

            //进行查询
            List<YbdQuestionBack> list = questionBackDao.myFavorite(infoIdStr);

            //进行分页
            PageHelper.startPage(pageNum, pageSize);

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

        //错题查询
        List<YbdQuestionBack> list = questionBackDao.myCovenant(id);

//        如果有错题就进行操作 否则返回空集合
        if(list.size()>0) {

            for (int i = 0; i < list.size(); i++) {
                //根据题目id查询 错误选项
                String errorOptionDescribe =questionBackDao.findError(list.get(i).getId(),list.get(i).getCreateUser());
                //将查询到的错误选项放到对应的实体类
                list.get(i).setErrorOptionDescribe(errorOptionDescribe);
            }

            //进行分页
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

//        根据用户id查询礼物
        List<YbdExchanageMall> list = questionBackDao.queryConvertRecord(id);

        //进行分页
        PageHelper.startPage(pageNum, pageSize);

        PageInfo<YbdExchanageMall> p = new PageInfo<>(list);

        p.setTotal((int) p.getTotal());

        p.setList(p.getList());

        return p;
    }

    @Override
    public List<YbdExchanageMall> queryConvertRecord2(String id) {
        return questionBackDao.queryConvertRecord2(id);
    }

    @Override
    public PageInfo<YbdExchanageMall> myContract(Integer pageNum, Integer pageSize, String id) {
        //        根据用户id查询积分记录
        List<YbdExchanageMall> list = questionBackDao.myContract(id);

        //进行分页
        PageHelper.startPage(pageNum, pageSize);

        PageInfo<YbdExchanageMall> p = new PageInfo<>(list);

        p.setTotal((int) p.getTotal());

        p.setList(p.getList());

        return p;
    }
}
