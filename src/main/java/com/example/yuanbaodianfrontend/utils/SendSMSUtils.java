package com.example.yuanbaodianfrontend.utils;

import java.util.HashMap;

import com.cloopen.rest.sdk.CCPRestSmsSDK;

public class SendSMSUtils {
	public static boolean sendMSM(String phone,String code){
		   HashMap<String, Object> result = null;
		   //初始化SDK
		   CCPRestSmsSDK restAPI = new CCPRestSmsSDK();
		   // 初始化服务器地址和端口
	  
		   restAPI.init("app.cloopen.com", "8883");
		   //设置业务信息   
		// 初始化主账号名称和主账号令牌，
			restAPI.setAccount("8aaf07086812057f0168313b618c106e", "c56fc2d0fe2b40bb8cd6bf5ad4761165");//
			restAPI.setAppId("8aaf07086812057f0168313b61dd1074");
		   /*restAPI.setAccount("8a216da8679d0e9d0167c50658141792","11f4d6cc0dfd46709c819140c0de4cbd");//
		   restAPI.setAppId(  "8a216da8679d0e9d0167c506586e1799");*/
		   //请使用管理控制台中已创建应用的APPID。则13800000000手机号收到的短信内容是：【云通讯】您使用的是云通讯短信模板，您的验证码是6532，请于5分钟内
		result = restAPI.sendTemplateSMS(phone, "1", new String[]{code, "5"});
		   //获取发送结果
		   if("000000".equals(result.get("statusCode"))){
			   System.out.println("发送成功");
			   return true;
		   } else {
			   System.out.println(" 错误信息: " + result.get("statusMsg"));
			   return false;
		   }
	   }
}
