package com.quilt.service;

import com.quilt.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {


    int addComment(Comment comment);

    int deleteComment(Integer id);

    List<Comment> getAllUserComment();

    List<Comment> getAllReply();

    Comment getCommentById(Integer id);

    int  modComment(Comment comment);

    /**
     * 根据文章ID获取所有评论
     */
    List<Comment> getAllCommentByArticleId(Integer articleId);

    /**
     * 得到评论总数
     * @return
     */
    int  getCommentCount();

    /**
     * 得到前八条评论
     * @return
     */
    List<Comment> getTop8Comment();


}
