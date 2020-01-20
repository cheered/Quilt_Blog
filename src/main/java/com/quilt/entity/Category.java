package com.quilt.entity;

import java.util.Date;

public class Category {
    /**
     * ����ID
     */
    private Integer id;

    /**
     * ���ڵ�Id
     */
    private Integer categoryPid;

    /**
     * �������
     */
    private String categoryName;

    /**
     * �������
     */
    private String categoryDescription;

    /**
     * ����ʱ��
     */
    private Date createTime;

    /**
     * ��ȡ�ֶ�id������ID����ֵ
     */
    public Integer getId() {
        return id;
    }

    /**
     * �����ֶ�id������ID����ֵ
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * ��ȡ�ֶ�category_pid�����ڵ�Id����ֵ
     */
    public Integer getCategoryPid() {
        return categoryPid;
    }

    /**
     * �����ֶ�category_pid�����ڵ�Id����ֵ
     */
    public void setCategoryPid(Integer categoryPid) {
        this.categoryPid = categoryPid;
    }

    /**
     * ��ȡ�ֶ�category_name��������ƣ���ֵ
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * �����ֶ�category_name��������ƣ���ֵ
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    /**
     * ��ȡ�ֶ�category_description�������������ֵ
     */
    public String getCategoryDescription() {
        return categoryDescription;
    }

    /**
     * �����ֶ�category_description�������������ֵ
     */
    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription == null ? null : categoryDescription.trim();
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