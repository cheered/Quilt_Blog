package com.quilt.entity;

public class ArticleCategory {
    /**
     * 文章ID
     */
    private Integer articleId;

    /**
     * 类别Id
     */
    private Integer categoryId;

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
     * 获取字段category_id（类别Id）的值
     */
    public Integer getCategoryId() {
        return categoryId;
    }

    /**
     * 设置字段category_id（类别Id）的值
     */
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}