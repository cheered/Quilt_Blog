package com.quilt.entity;

import java.util.Date;

public class Tag {
    /**
     * ��ǩID
     */
    private Integer id;

    /**
     * �������
     */
    private String tagName;

    /**
     * �����С
     */
    private String fontSize;

    /**
     * ������ɫ
     */
    private String fontColor;

    /**
     * ����ʱ��
     */
    private Date createTime;

    /**
     * ��ȡ�ֶ�id����ǩID����ֵ
     */
    public Integer getId() {
        return id;
    }

    /**
     * �����ֶ�id����ǩID����ֵ
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * ��ȡ�ֶ�tag_name��������ƣ���ֵ
     */
    public String getTagName() {
        return tagName;
    }

    /**
     * �����ֶ�tag_name��������ƣ���ֵ
     */
    public void setTagName(String tagName) {
        this.tagName = tagName == null ? null : tagName.trim();
    }

    /**
     * ��ȡ�ֶ�font_size�������С����ֵ
     */
    public String getFontSize() {
        return fontSize;
    }

    /**
     * �����ֶ�font_size�������С����ֵ
     */
    public void setFontSize(String fontSize) {
        this.fontSize = fontSize == null ? null : fontSize.trim();
    }

    /**
     * ��ȡ�ֶ�font_color��������ɫ����ֵ
     */
    public String getFontColor() {
        return fontColor;
    }

    /**
     * �����ֶ�font_color��������ɫ����ֵ
     */
    public void setFontColor(String fontColor) {
        this.fontColor = fontColor == null ? null : fontColor.trim();
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