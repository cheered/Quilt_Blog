package com.quilt.dao;

import com.quilt.entity.Article;
import com.quilt.entity.ArticleWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDAO {
    /**
     * 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 
     */
    int insert(ArticleWithBLOBs record);

    /**
     * 
     */
    int insertSelective(ArticleWithBLOBs record);

    /**
     * 
     */
    ArticleWithBLOBs selectByPrimaryKey(Integer id);

    /**
     * 
     */
    int updateByPrimaryKeySelective(ArticleWithBLOBs record);

    /**
     * 
     */
    int updateByPrimaryKeyWithBLOBs(ArticleWithBLOBs record);

    /**
     * 
     */
    int updateByPrimaryKey(Article record);

    /**
     * 返回主键
     * @param articleWithBLOBs
     * @return
     */
    int insertArticleWithBLOBs(ArticleWithBLOBs articleWithBLOBs);

    List<Article> getAllArticle();

    int getArticleCount();

    List<Article> getTop8Article();

    List<ArticleWithBLOBs> getAllArticleWithBLOBs();

    /**
     * 根据分类ID获得相关文章
     */
    List<Article> getArticleListByCategoryId(@Param("categoryId") Integer categoryId);

    /**
     * 根据标签ID获得相关文章
     */
    List<Article> getArticleListByTagId(@Param("tagId") Integer tagId);

    int viewCountPlusOne(@Param("articleId") Integer articleId);

    List<Article> getArticleListByTitle(@Param("title") String title);

}