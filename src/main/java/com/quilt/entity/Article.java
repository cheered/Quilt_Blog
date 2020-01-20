package com.quilt.entity;

import java.util.Date;

public class Article {
    /**
     * ����ID
     */
    private Integer id;

    /**
     * �����û�ID
     */
    private Integer userId;

    /**
     * ���±���
     */
    private String title;

    /**
     * �������ͣ�0Ϊԭ����1ת�أ�
     */
    private Integer articleType;

    /**
     * �������ͣ�0�ݸ塢1���ģ�
     */
    private Integer issueType;

    /**
     * ������ҳͼƬ
     */
    private String articlePic;

    /**
     * �����
     */
    private Integer viewCount;

    /**
     * ��������
     */
    private Integer commentCount;

    /**
     * ����ʱ��
     */
    private Date updateTime;

    /**
     * ����ʱ��
     */
    private Date createTime;

    /**
     * ��ȡ�ֶ�id������ID����ֵ
     */
    public Integer getId() {
        return id;
    }

    /**
     * �����ֶ�id������ID����ֵ
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * ��ȡ�ֶ�user_id�������û�ID����ֵ
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * �����ֶ�user_id�������û�ID����ֵ
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * ��ȡ�ֶ�title�����±��⣩��ֵ
     */
    public String getTitle() {
        return title;
    }

    /**
     * �����ֶ�title�����±��⣩��ֵ
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * ��ȡ�ֶ�article_type���������ͣ�0Ϊԭ����1ת�أ�����ֵ
     */
    public Integer getArticleType() {
        return articleType;
    }

    /**
     * �����ֶ�article_type���������ͣ�0Ϊԭ����1ת�أ�����ֵ
     */
    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    /**
     * ��ȡ�ֶ�issue_type���������ͣ�0�ݸ塢1���ģ�����ֵ
     */
    public Integer getIssueType() {
        return issueType;
    }

    /**
     * �����ֶ�issue_type���������ͣ�0�ݸ塢1���ģ�����ֵ
     */
    public void setIssueType(Integer issueType) {
        this.issueType = issueType;
    }

    /**
     * ��ȡ�ֶ�article_pic��������ҳͼƬ����ֵ
     */
    public String getArticlePic() {
        return articlePic;
    }

    /**
     * �����ֶ�article_pic��������ҳͼƬ����ֵ
     */
    public void setArticlePic(String articlePic) {
        this.articlePic = articlePic == null ? null : articlePic.trim();
    }

    /**
     * ��ȡ�ֶ�view_count�����������ֵ
     */
    public Integer getViewCount() {
        return viewCount;
    }

    /**
     * �����ֶ�view_count�����������ֵ
     */
    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    /**
     * ��ȡ�ֶ�comment_count��������������ֵ
     */
    public Integer getCommentCount() {
        return commentCount;
    }

    /**
     * �����ֶ�comment_count��������������ֵ
     */
    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    /**
     * ��ȡ�ֶ�update_time������ʱ�䣩��ֵ
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * �����ֶ�update_time������ʱ�䣩��ֵ
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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