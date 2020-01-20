package com.quilt.entity;

import java.util.Date;

public class Comment {
    /**
     * 评论ID
     */
    private Integer id;

    /**
     * 评论的文章ID
     */
    private Integer articleId;

    /**
     * 用户头像
     */
    private String headPic;

    /**
     * 回复评论
     */
    private Integer commentPid;

    /**
     * 评论者姓名
     */
    private String commentName;

    /**
     * 评论者邮箱
     */
    private String commentEmail;

    /**
     * 评论内容
     */
    private String commentContent;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 获取字段id（评论ID）的值
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置字段id（评论ID）的值
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取字段article_id（评论的文章ID）的值
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * 设置字段article_id（评论的文章ID）的值
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    /**
     * 获取字段head_pic（用户头像）的值
     */
    public String getHeadPic() {
        return headPic;
    }

    /**
     * 设置字段head_pic（用户头像）的值
     */
    public void setHeadPic(String headPic) {
        this.headPic = headPic == null ? null : headPic.trim();
    }

    /**
     * 获取字段comment_pid（回复评论）的值
     */
    public Integer getCommentPid() {
        return commentPid;
    }

    /**
     * 设置字段comment_pid（回复评论）的值
     */
    public void setCommentPid(Integer commentPid) {
        this.commentPid = commentPid;
    }

    /**
     * 获取字段comment_name（评论者姓名）的值
     */
    public String getCommentName() {
        return commentName;
    }

    /**
     * 设置字段comment_name（评论者姓名）的值
     */
    public void setCommentName(String commentName) {
        this.commentName = commentName == null ? null : commentName.trim();
    }

    /**
     * 获取字段comment_email（评论者邮箱）的值
     */
    public String getCommentEmail() {
        return commentEmail;
    }

    /**
     * 设置字段comment_email（评论者邮箱）的值
     */
    public void setCommentEmail(String commentEmail) {
        this.commentEmail = commentEmail == null ? null : commentEmail.trim();
    }

    /**
     * 获取字段comment_content（评论内容）的值
     */
    public String getCommentContent() {
        return commentContent;
    }

    /**
     * 设置字段comment_content（评论内容）的值
     */
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
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