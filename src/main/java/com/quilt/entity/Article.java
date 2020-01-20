package com.quilt.entity;

import java.util.Date;

public class Article {
    /**
     * 文章ID
     */
    private Integer id;

    /**
     * 发布用户ID
     */
    private Integer userId;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文章类型（0为原创，1转载）
     */
    private Integer articleType;

    /**
     * 发布类型（0草稿、1正文）
     */
    private Integer issueType;

    /**
     * 文章首页图片
     */
    private String articlePic;

    /**
     * 点击量
     */
    private Integer viewCount;

    /**
     * 评论数量
     */
    private Integer commentCount;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 获取字段id（文章ID）的值
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置字段id（文章ID）的值
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取字段user_id（发布用户ID）的值
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置字段user_id（发布用户ID）的值
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取字段title（文章标题）的值
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置字段title（文章标题）的值
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * 获取字段article_type（文章类型（0为原创，1转载））的值
     */
    public Integer getArticleType() {
        return articleType;
    }

    /**
     * 设置字段article_type（文章类型（0为原创，1转载））的值
     */
    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    /**
     * 获取字段issue_type（发布类型（0草稿、1正文））的值
     */
    public Integer getIssueType() {
        return issueType;
    }

    /**
     * 设置字段issue_type（发布类型（0草稿、1正文））的值
     */
    public void setIssueType(Integer issueType) {
        this.issueType = issueType;
    }

    /**
     * 获取字段article_pic（文章首页图片）的值
     */
    public String getArticlePic() {
        return articlePic;
    }

    /**
     * 设置字段article_pic（文章首页图片）的值
     */
    public void setArticlePic(String articlePic) {
        this.articlePic = articlePic == null ? null : articlePic.trim();
    }

    /**
     * 获取字段view_count（点击量）的值
     */
    public Integer getViewCount() {
        return viewCount;
    }

    /**
     * 设置字段view_count（点击量）的值
     */
    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    /**
     * 获取字段comment_count（评论数量）的值
     */
    public Integer getCommentCount() {
        return commentCount;
    }

    /**
     * 设置字段comment_count（评论数量）的值
     */
    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    /**
     * 获取字段update_time（更新时间）的值
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置字段update_time（更新时间）的值
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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