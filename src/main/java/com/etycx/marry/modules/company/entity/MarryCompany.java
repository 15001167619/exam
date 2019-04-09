package com.etycx.marry.modules.company.entity;

import com.etycx.marry.common.persistence.DataEntity;

public class MarryCompany extends DataEntity<MarryCompany> {

    private String id;

    private String mainPic;

    private String name;

    private String title;

    private String introduction;

    private String culturePic;

    private String worthPic;

    private String development;

    private String allnumber;//全国电话

    private String servertime;

    private String address;

    private String code;

    private String cellphone;

    private int state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMainPic() {
        return mainPic;
    }

    public void setMainPic(String mainPic) {
        this.mainPic = mainPic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCulturePic() {
        return culturePic;
    }

    public void setCulturePic(String culturePic) {
        this.culturePic = culturePic;
    }

    public String getWorthPic() {
        return worthPic;
    }

    public void setWorthPic(String worthPic) {
        this.worthPic = worthPic;
    }

    public String getDevelopment() {
        return development;
    }

    public void setDevelopment(String development) {
        this.development = development;
    }

    public String getAllnumber() {
        return allnumber;
    }

    public void setAllnumber(String allnumber) {
        this.allnumber = allnumber;
    }

    public String getServertime() {
        return servertime;
    }

    public void setServertime(String servertime) {
        this.servertime = servertime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
