package com.etycx.marry.modules.expect.entity;

import com.etycx.marry.common.persistence.DataEntity;

import java.util.Date;

public class Expect extends DataEntity<Expect> {

    private String id;

    private Long userId;

    private String hobby;

    private int age;

    private String priceScope;

    private int status;

    private Date createTime;

    private Date WeddingTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPriceScope() {
        return priceScope;
    }

    public void setPriceScope(String priceScope) {
        this.priceScope = priceScope;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getWeddingTime() {
        return WeddingTime;
    }

    public void setWeddingTime(Date weddingTime) {
        WeddingTime = weddingTime;
    }
}
