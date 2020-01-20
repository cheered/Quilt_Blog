package com.quilt.service.impl;

import com.quilt.dao.ArticleDAO;
import com.quilt.dao.CommentDAO;
import com.quilt.entity.ArticleWithBLOBs;
import com.quilt.entity.Comment;
import com.quilt.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDAO commentDAO;

    @Autowired
    ArticleDAO articleDAO;

    @Override
    @Transactional
    public int addComment(Comment comment) {

        int r = commentDAO.insertSelective(comment);

        int commentCount = commentDAO.getCommentCountByArticleId(comment.getArticleId());

        ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
        articleWithBLOBs.setId(comment.getArticleId());
        articleWithBLOBs.setCommentCount(commentCount);

        articleDAO.updateByPrimaryKeySelective(articleWithBLOBs);

        return r;
    }

    @Override
    @Transactional
    public int deleteComment(Integer id) {

        Comment comment = commentDAO.selectByPrimaryKey(id);

        //删除子节点
        commentDAO.deleteReplyByPid(id);

        int r = commentDAO.deleteByPrimaryKey(id);

        int commentCount = commentDAO.getCommentCountByArticleId(comment.getArticleId());

        ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
        articleWithBLOBs.setId(comment.getArticleId());
        articleWithBLOBs.setCommentCount(commentCount);

        articleDAO.updateByPrimaryKeySelective(articleWithBLOBs);

        return r;
    }

    @Override
    public List<Comment> getAllUserComment() {

        return commentDAO.getAllUserComment();
    }

    @Override
    public List<Comment> getAllReply() {

        return commentDAO.getAllReply();
    }

    @Override
    public Comment getCommentById(Integer id) {

        return commentDAO.selectByPrimaryKey(id);
    }

    @Override
    public int modComment(Comment comment) {

        return commentDAO.updateByPrimaryKeySelective(comment);
    }

    @Override
    public List<Comment> getAllCommentByArticleId(Integer articleId) {

        return commentDAO.getAllCommentByArticleId(articleId);
    }

    @Override
    public int getCommentCount() {
        return commentDAO.getCommentCount();
    }

    @Override
    public List<Comment> getTop8Comment() {
        return commentDAO.getTop8Comment();
    }
}
