package com.quilt.dao;

import com.quilt.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDAO {
    /**
     * 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 
     */
    int insert(Comment record);

    /**
     * 
     */
    int insertSelective(Comment record);

    /**
     * 
     */
    Comment selectByPrimaryKey(Integer id);

    /**
     * 
     */
    int updateByPrimaryKeySelective(Comment record);

    /**
     * 
     */
    int updateByPrimaryKey(Comment record);

    /**
     * 根据ID删除评论及回复
     */

    int deleteReplyByPid(@Param("pid") Integer pid);

    /**
     * 得到所有用户评论
     * @return
     */
    List<Comment> getAllUserComment();

    /**
     * 得到所有回复
     * @return
     */
    List<Comment> getAllReply();

    /**
     * 根据文章ID获取评论
     */

    List<Comment> getAllCommentByArticleId(Integer id);


    int  getCommentCount();

    List<Comment> getTop8Comment();

    int deleteCommentByArticleId(@Param("articleId") Integer articleId);

    /**
     * 根据文章ID获取评论数
     * （记得param）
     * @param articleId
     * @return
     */
    int getCommentCountByArticleId(@Param("articleId") Integer articleId);
}