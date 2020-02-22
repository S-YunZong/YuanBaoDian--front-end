package com.example.yuanbaodianfrontend.service;

import com.example.yuanbaodianfrontend.pojo.YbdExchanageMall;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface ExchanageMallService {

    List<YbdExchanageMall> SelectExchanageMall();
}
