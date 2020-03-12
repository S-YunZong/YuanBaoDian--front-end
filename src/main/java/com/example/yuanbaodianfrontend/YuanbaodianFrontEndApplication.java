package com.example.yuanbaodianfrontend;

import org.apache.catalina.connector.Connector;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.example.yuanbaodianfrontend.dao")
@Configuration
//定时器
@EnableScheduling
@EnableAsync//开启异步注解功能
public class YuanbaodianFrontEndApplication {

    public static void main(String[] args) {
        SpringApplication.run(YuanbaodianFrontEndApplication.class, args);
    }

}
