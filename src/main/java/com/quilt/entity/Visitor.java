package com.quilt.entity;

import java.util.Date;

public class Visitor {
    /**
     * 访客ID
     */
    private Integer id;

    /**
     * IP地址
     */
    private String ip;

    /**
     * 浏览器类型
     */
    private String brower;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 获取字段id（访客ID）的值
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置字段id（访客ID）的值
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取字段ip（IP地址）的值
     */
    public String getIp() {
        return ip;
    }

    /**
     * 设置字段ip（IP地址）的值
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    /**
     * 获取字段brower（浏览器类型）的值
     */
    public String getBrower() {
        return brower;
    }

    /**
     * 设置字段brower（浏览器类型）的值
     */
    public void setBrower(String brower) {
        this.brower = brower == null ? null : brower.trim();
    }

    /**
     * 获取字段create_time（创建时间）的值
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置字段create_time（创建时间）的值
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}