package com.quilt.service;

import com.quilt.entity.Article;
import com.quilt.entity.ArticleWithBLOBs;
import com.quilt.utils.PagedResult;

import java.util.List;

public interface ArticleService {

    /**
     * 根据ID获取文章信息
     * @param id
     * @return
     */
    ArticleWithBLOBs getArticleById(Integer id);

    /**
     * 发布文章
     * @param articleWithBLOBs
     * @return
     */
    int writeArticle(ArticleWithBLOBs articleWithBLOBs,Integer[] categoryIds,Integer[] tagIds);

    List<Article> getAllArticle();

    int deleteArticle(Integer id);


    int modArticle(ArticleWithBLOBs articleWithBLOBs,Integer[] categoryIds,Integer[] tagIds);

    /**
     * 得到文章总数
     * @return
     */
    int getArticleCount();

    /**
     * 得到前八条文章
     * @return
     */
    List<Article> getTop8Article();

    /**
     * 得到文章的所有信息
     * @return
     */
    List<ArticleWithBLOBs> getAllArticleWithBLOBs();

    /**
     * 文章点击量加1
     * @return
     */
    int viewCountPlusOne(Integer articleId);

    List<Article> getArticleListByTitle(String title);

    PagedResult<ArticleWithBLOBs> getArticlePage(Integer pageNo, Integer pageSize);
}
