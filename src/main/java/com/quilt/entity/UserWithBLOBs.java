package com.quilt.entity;

public class UserWithBLOBs extends User {
    /**
     * ���markdownԭ�ļ�
     */
    private String markdownContent;

    /**
     * ���HTML�ļ�
     */
    private String htmlContent;

    /**
     * ��ȡ�ֶ�markdown_content�����markdownԭ�ļ�����ֵ
     */
    public String getMarkdownContent() {
        return markdownContent;
    }

    /**
     * �����ֶ�markdown_content�����markdownԭ�ļ�����ֵ
     */
    public void setMarkdownContent(String markdownContent) {
        this.markdownContent = markdownContent == null ? null : markdownContent.trim();
    }

    /**
     * ��ȡ�ֶ�html_content�����HTML�ļ�����ֵ
     */
    public String getHtmlContent() {
        return htmlContent;
    }

    /**
     * �����ֶ�html_content�����HTML�ļ�����ֵ
     */
    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent == null ? null : htmlContent.trim();
    }
}