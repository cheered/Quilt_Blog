package com.quilt.entity;

public class ArticleTag {
    /**
     * 文章ID
     */
    private Integer articleId;

    /**
     * 标签Id
     */
    private Integer tagId;

    /**
     * 获取字段article_id（文章ID）的值
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * 设置字段article_id（文章ID）的值
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    /**
     * 获取字段tag_id（标签Id）的值
     */
    public Integer getTagId() {
        return tagId;
    }

    /**
     * 设置字段tag_id（标签Id）的值
     */
    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }
}