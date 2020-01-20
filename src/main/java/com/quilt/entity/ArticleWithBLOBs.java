package com.quilt.entity;

public class ArticleWithBLOBs extends Article {
    /**
     * 文章markdown原文件
     */
    private String markdownContent;

    /**
     * 文章HTML文件
     */
    private String htmlContent;

    /**
     * 获取字段markdown_content（文章markdown原文件）的值
     */
    public String getMarkdownContent() {
        return markdownContent;
    }

    /**
     * 设置字段markdown_content（文章markdown原文件）的值
     */
    public void setMarkdownContent(String markdownContent) {
        this.markdownContent = markdownContent == null ? null : markdownContent.trim();
    }

    /**
     * 获取字段html_content（文章HTML文件）的值
     */
    public String getHtmlContent() {
        return htmlContent;
    }

    /**
     * 设置字段html_content（文章HTML文件）的值
     */
    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent == null ? null : htmlContent.trim();
    }
}