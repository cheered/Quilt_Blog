package com.quilt.entity;

import java.util.Date;

public class Log {
    /**
     * ��־ID
     */
    private Integer id;

    /**
     * ��������
     */
    private String logType;

    /**
     * ��ϸ����
     */
    private String logDetail;

    /**
     * IP��ַ
     */
    private String ip;

    /**
     * ����ʱ��
     */
    private Date createTime;

    /**
     * ��ȡ�ֶ�id����־ID����ֵ
     */
    public Integer getId() {
        return id;
    }

    /**
     * �����ֶ�id����־ID����ֵ
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * ��ȡ�ֶ�log_type���������ͣ���ֵ
     */
    public String getLogType() {
        return logType;
    }

    /**
     * �����ֶ�log_type���������ͣ���ֵ
     */
    public void setLogType(String logType) {
        this.logType = logType == null ? null : logType.trim();
    }

    /**
     * ��ȡ�ֶ�log_detail����ϸ���ݣ���ֵ
     */
    public String getLogDetail() {
        return logDetail;
    }

    /**
     * �����ֶ�log_detail����ϸ���ݣ���ֵ
     */
    public void setLogDetail(String logDetail) {
        this.logDetail = logDetail == null ? null : logDetail.trim();
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

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", logType='" + logType + '\'' +
                ", logDetail='" + logDetail + '\'' +
                ", ip='" + ip + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}