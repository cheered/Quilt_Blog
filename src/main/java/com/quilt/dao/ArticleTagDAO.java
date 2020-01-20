package com.quilt.dao;

import com.quilt.entity.ArticleTag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleTagDAO {
    /**
     * 
     */
    int insert(ArticleTag record);

    /**
     * 
     */
    int insertSelective(ArticleTag record);

    /**
     * 批量插入标签
     * @param articleTags
     * @return
     */
    int insertArticleTagList(@Param("articleTags") List<ArticleTag> articleTags);

    /**
     * 根据文章ID/标签ID删除关联
     */

    int deleteArticleTagByArticleId(@Param("articleId") Integer articleId);

    int deleteArticleTagByTagId(@Param("tagId") Integer tagId);

    /**
     * 根据文章ID/标签ID获取关联
     */

    List<ArticleTag> getArticleTagByArticleId(@Param("articleId") Integer articleId);

    List<ArticleTag> getArticleTagByTagId(@Param("tagId") Integer tagId);

    int getArticleCountByTagId(@Param("tagId") Integer tagId);
}