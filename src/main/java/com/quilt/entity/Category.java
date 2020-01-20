package com.quilt.entity;

import java.util.Date;

public class Category {
    /**
     * 分类ID
     */
    private Integer id;

    /**
     * 父节点Id
     */
    private Integer categoryPid;

    /**
     * 类别名称
     */
    private String categoryName;

    /**
     * 类别描述
     */
    private String categoryDescription;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 获取字段id（分类ID）的值
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置字段id（分类ID）的值
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取字段category_pid（父节点Id）的值
     */
    public Integer getCategoryPid() {
        return categoryPid;
    }

    /**
     * 设置字段category_pid（父节点Id）的值
     */
    public void setCategoryPid(Integer categoryPid) {
        this.categoryPid = categoryPid;
    }

    /**
     * 获取字段category_name（类别名称）的值
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * 设置字段category_name（类别名称）的值
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    /**
     * 获取字段category_description（类别描述）的值
     */
    public String getCategoryDescription() {
        return categoryDescription;
    }

    /**
     * 设置字段category_description（类别描述）的值
     */
    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription == null ? null : categoryDescription.trim();
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