package com.quilt.entity;

public class ArticleCategory {
    /**
     * ����ID
     */
    private Integer articleId;

    /**
     * ���Id
     */
    private Integer categoryId;

    /**
     * ��ȡ�ֶ�article_id������ID����ֵ
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * �����ֶ�article_id������ID����ֵ
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    /**
     * ��ȡ�ֶ�category_id�����Id����ֵ
     */
    public Integer getCategoryId() {
        return categoryId;
    }

    /**
     * �����ֶ�category_id�����Id����ֵ
     */
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}