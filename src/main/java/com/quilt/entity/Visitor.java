package com.quilt.entity;

import java.util.Date;

public class Visitor {
    /**
     * �ÿ�ID
     */
    private Integer id;

    /**
     * IP��ַ
     */
    private String ip;

    /**
     * ���������
     */
    private String brower;

    /**
     * ����ʱ��
     */
    private Date createTime;

    /**
     * ��ȡ�ֶ�id���ÿ�ID����ֵ
     */
    public Integer getId() {
        return id;
    }

    /**
     * �����ֶ�id���ÿ�ID����ֵ
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * ��ȡ�ֶ�ip��IP��ַ����ֵ
     */
    public String getIp() {
        return ip;
    }

    /**
     * �����ֶ�ip��IP��ַ����ֵ
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    /**
     * ��ȡ�ֶ�brower����������ͣ���ֵ
     */
    public String getBrower() {
        return brower;
    }

    /**
     * �����ֶ�brower����������ͣ���ֵ
     */
    public void setBrower(String brower) {
        this.brower = brower == null ? null : brower.trim();
    }

    /**
     * ��ȡ�ֶ�create_time������ʱ�䣩��ֵ
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * �����ֶ�create_time������ʱ�䣩��ֵ
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}