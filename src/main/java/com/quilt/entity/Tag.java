package com.quilt.entity;

import java.util.Date;

public class Tag {
    /**
     * 标签ID
     */
    private Integer id;

    /**
     * 类别名称
     */
    private String tagName;

    /**
     * 字体大小
     */
    private String fontSize;

    /**
     * 字体颜色
     */
    private String fontColor;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 获取字段id（标签ID）的值
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置字段id（标签ID）的值
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取字段tag_name（类别名称）的值
     */
    public String getTagName() {
        return tagName;
    }

    /**
     * 设置字段tag_name（类别名称）的值
     */
    public void setTagName(String tagName) {
        this.tagName = tagName == null ? null : tagName.trim();
    }

    /**
     * 获取字段font_size（字体大小）的值
     */
    public String getFontSize() {
        return fontSize;
    }

    /**
     * 设置字段font_size（字体大小）的值
     */
    public void setFontSize(String fontSize) {
        this.fontSize = fontSize == null ? null : fontSize.trim();
    }

    /**
     * 获取字段font_color（字体颜色）的值
     */
    public String getFontColor() {
        return fontColor;
    }

    /**
     * 设置字段font_color（字体颜色）的值
     */
    public void setFontColor(String fontColor) {
        this.fontColor = fontColor == null ? null : fontColor.trim();
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