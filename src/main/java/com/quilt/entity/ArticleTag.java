package com.quilt.entity;

public class ArticleTag {
    /**
     * ����ID
     */
    private Integer articleId;

    /**
     * ��ǩId
     */
    private Integer tagId;

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
     * ��ȡ�ֶ�tag_id����ǩId����ֵ
     */
    public Integer getTagId() {
        return tagId;
    }

    /**
     * �����ֶ�tag_id����ǩId����ֵ
     */
    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }
}