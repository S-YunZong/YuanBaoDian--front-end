package com.example.yuanbaodianfrontend.utils;


import com.aliyun.oss.ClientConfiguration;
import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.CreateBucketRequest;
import com.aliyun.oss.model.PutObjectRequest;
import com.aliyun.oss.model.PutObjectResult;
import com.example.yuanbaodianfrontend.pojo.OSSProperties;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author lujiasheng
 * @create 2019-10-19 下午 1:11
 * @desc 阿里云oss工具类
 **/
public class AliyunOSSUtil {
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AliyunOSSUtil.class);

    public static String upload(File file){
        logger.info("=========>OSS文件上传开始："+file.getName());
        String endpoint= OSSProperties.ALIYUN_ENDPOINT;
        String accessKeyId= OSSProperties.ALIYUN_ACCESS_ID;
        String accessKeySecret= OSSProperties.ALIYUN_ACCESS_KEY;
        String bucketName= OSSProperties.ALIYUN_BUCKET;
        String fileHost= OSSProperties.ALIYUN_DIR;

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = format.format(new Date());

        if(null == file){
            return null;
        }
        //创建一个服务器
        OSSClient ossClient = new OSSClient(endpoint,accessKeyId,accessKeySecret);
        ClientConfiguration clientConfiguration=new ClientConfiguration();
        /**
         * 连接超时时间为100秒
         */
        clientConfiguration.setConnectionTimeout(100000);
        try {
            //容器不存在，就创建
            if(! ossClient.doesBucketExist(bucketName)){
                ossClient.createBucket(bucketName);
                CreateBucketRequest createBucketRequest = new CreateBucketRequest(bucketName);
                createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
                ossClient.createBucket(createBucketRequest);
            }
            //创建文件路径
            String fileUrl = fileHost+"/"+(dateStr + "/" + UUID.randomUUID().toString().replace("-","")+"-"+file.getName()+".png");
            //上传文件
            PutObjectResult result = ossClient.putObject(new PutObjectRequest(bucketName, fileUrl, file));
        /*    //设置权限 这里是公开读
            ossClient.setBucketAcl(bucketName,CannedAccessControlList.PublicRead);*/
            if(null != result){
                logger.info("==========>OSS文件上传成功,OSS地址："+fileUrl);
                return "http://kangkang666666.oss-cn-beijing.aliyuncs.com/"+fileUrl;
            }
        }catch (OSSException oe){
            logger.error(oe.getMessage());
        }catch (ClientException ce){
            logger.error(ce.getMessage());
        }finally {
            //关闭
            ossClient.shutdown();
        }
        return null;
    }


}

