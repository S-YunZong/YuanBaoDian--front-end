package com.example.yuanbaodianfrontend.pojo;

public class YbdPicture {
    private Integer id;
    private String pictureType;
    private String pictureUrl;

    public String getPictureType() {
        return pictureType;
    }

    public void setPictureType(String pictureType) {
        this.pictureType = pictureType;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public Integer getPserId() {
        return pserId;
    }

    public void setPserId(Integer pserId) {
        this.pserId = pserId;
    }

    private Integer pserId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "YbdPicture{" +
                "id=" + id +
                ", pictureType='" + pictureType + '\'' +
                ", pictureUrl='" + pictureUrl + '\'' +
                ", pserId=" + pserId +
                '}';
    }
}
