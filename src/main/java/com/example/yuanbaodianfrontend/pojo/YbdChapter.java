package com.example.yuanbaodianfrontend.pojo;

import lombok.Data;

@Data
public class YbdChapter {
    private Integer id;

    private Integer chapterId;//id

    private String chapterName;//章节名称

    private String chapterDescribe;//描述

    private Integer chapterSerialNumber;//编号

}