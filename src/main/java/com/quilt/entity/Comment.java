package com.quilt.entity;

import java.util.Date;

public class Comment {
    /**
     * ����ID
     */
    private Integer id;

    /**
     * ���۵�����ID
     */
    private Integer articleId;

    /**
     * �û�ͷ��
     */
    private String headPic;

    /**
     * �ظ�����
     */
    private Integer commentPid;

    /**
     * ����������
     */
    private String commentName;

    /**
     * ����������
     */
    private String commentEmail;

    /**
     * ��������
     */
    private String commentContent;

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
     * ��ȡ�ֶ�article_id�����۵�����ID����ֵ
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * �����ֶ�article_id�����۵�����ID����ֵ
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    /**
     * ��ȡ�ֶ�head_pic���û�ͷ�񣩵�ֵ
     */
    public String getHeadPic() {
        return headPic;
    }

    /**
     * �����ֶ�head_pic���û�ͷ�񣩵�ֵ
     */
    public void setHeadPic(String headPic) {
        this.headPic = headPic == null ? null : headPic.trim();
    }

    /**
     * ��ȡ�ֶ�comment_pid���ظ����ۣ���ֵ
     */
    public Integer getCommentPid() {
        return commentPid;
    }

    /**
     * �����ֶ�comment_pid���ظ����ۣ���ֵ
     */
    public void setCommentPid(Integer commentPid) {
        this.commentPid = commentPid;
    }

    /**
     * ��ȡ�ֶ�comment_name����������������ֵ
     */
    public String getCommentName() {
        return commentName;
    }

    /**
     * �����ֶ�comment_name����������������ֵ
     */
    public void setCommentName(String commentName) {
        this.commentName = commentName == null ? null : commentName.trim();
    }

    /**
     * ��ȡ�ֶ�comment_email�����������䣩��ֵ
     */
    public String getCommentEmail() {
        return commentEmail;
    }

    /**
     * �����ֶ�comment_email�����������䣩��ֵ
     */
    public void setCommentEmail(String commentEmail) {
        this.commentEmail = commentEmail == null ? null : commentEmail.trim();
    }

    /**
     * ��ȡ�ֶ�comment_content���������ݣ���ֵ
     */
    public String getCommentContent() {
        return commentContent;
    }

    /**
     * �����ֶ�comment_content���������ݣ���ֵ
     */
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
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