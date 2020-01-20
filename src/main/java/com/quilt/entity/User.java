package com.quilt.entity;

import java.util.Date;

public class User {
    /**
     * 用户ID
     */
    private Integer id;

    /**
     * 登录用户名
     */
    private String username;

    /**
     * 登录密码
     */
    private String password;

    /**
     * 用户头像
     */
    private String headPic;

    /**
     * 用户昵称
     */
    private String userNickname;

    /**
     * 用户签名
     */
    private String userSignature;

    /**
     * 用户邮箱
     */
    private String userEmail;

    /**
     * 用户标签
     */
    private String userTag;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 获取字段id（用户ID）的值
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置字段id（用户ID）的值
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取字段username（登录用户名）的值
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置字段username（登录用户名）的值
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * 获取字段password（登录密码）的值
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置字段password（登录密码）的值
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
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
     * 获取字段user_nickname（用户昵称）的值
     */
    public String getUserNickname() {
        return userNickname;
    }

    /**
     * 设置字段user_nickname（用户昵称）的值
     */
    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }

    /**
     * 获取字段user_signature（用户签名）的值
     */
    public String getUserSignature() {
        return userSignature;
    }

    /**
     * 设置字段user_signature（用户签名）的值
     */
    public void setUserSignature(String userSignature) {
        this.userSignature = userSignature == null ? null : userSignature.trim();
    }

    /**
     * 获取字段user_email（用户邮箱）的值
     */
    public String getUserEmail() {
        return userEmail;
    }

    /**
     * 设置字段user_email（用户邮箱）的值
     */
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    /**
     * 获取字段user_tag（用户标签）的值
     */
    public String getUserTag() {
        return userTag;
    }

    /**
     * 设置字段user_tag（用户标签）的值
     */
    public void setUserTag(String userTag) {
        this.userTag = userTag == null ? null : userTag.trim();
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

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", headPic='" + headPic + '\'' +
                ", userNickname='" + userNickname + '\'' +
                ", userSignature='" + userSignature + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userTag='" + userTag + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}