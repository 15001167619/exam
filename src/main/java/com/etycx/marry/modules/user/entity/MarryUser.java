package com.etycx.marry.modules.user.entity;

import com.etycx.marry.common.persistence.DataEntity;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.social.util.Constans;

import java.text.NumberFormat;
import java.util.Date;

public class MarryUser extends DataEntity<MarryUser> {

    private String id;

    private String name;

    private String phoneNum;

    private String password;

    private int age;

    private int sex;

    private int state;

    private String headUrl;

    private Constans.OpenIdType openType;

    private String openId;

    private String token;
    private Date createTime;
    private Date birthday;
    private Date weddingDate;

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getWeddingDate() {
        return weddingDate;
    }

    public void setWeddingDate(Date weddingDate) {
        this.weddingDate = weddingDate;
    }


    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


    public Constans.OpenIdType getOpenType() {
        return openType;
    }

    public void setOpenType(Constans.OpenIdType openType) {
        this.openType = openType;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public String getScale(){
        int i=0;
        if(StringUtils.isNotEmpty(this.getHeadUrl())){
            i++;
        }
        if(StringUtils.isNotEmpty(this.getName())){
            i++;
        }
        if(null!=this.getBirthday()){
            i++;
        }
        if(null!=this.getWeddingDate()){
            i++;
        }
        if(StringUtils.isNotEmpty(this.getPhoneNum())){
            i++;
        }
        NumberFormat nf = NumberFormat.getPercentInstance();
        nf.setMaximumFractionDigits(0);
        double s=(double)i/5;
        return nf.format(s);
    }
}
