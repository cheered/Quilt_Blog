package com.quilt.dao;

import com.quilt.entity.ArticleCategory;
import com.quilt.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleCategoryDAO {
    /**
     * 
     */
    int insert(ArticleCategory record);

    /**
     * 
     */
    int insertSelective(ArticleCategory record);

    /**
     * 批量插入关联对象
     * @param articleCategories
     * @return
     */
    int insertArticleCategoryList(@Param("articleCategories")List<ArticleCategory> articleCategories);

    /**
     * 根据文章ID/分类ID删除关联
     */

    int deleteArticleCategoryByArticleId(@Param("articleId") Integer articleId);

    int deleteArticleCategoryByCategoryId(@Param("CategoryId") Integer CategoryId);

    /**
     *
     * 根据文章ID/分类ID获取关联
     */
    List<ArticleCategory> getArticleCategoryByArticleId(@Param("articleId") Integer articleId);

    List<ArticleCategory> getArticleCategoryByCategoryId(@Param("CategoryId") Integer CategoryId);

    /**
     * 根据分类ID获取文章数量
     * @param categoryId
     * @return
     */
    int getArticleCountByCategoryId(@Param("categoryId") Integer categoryId);
}