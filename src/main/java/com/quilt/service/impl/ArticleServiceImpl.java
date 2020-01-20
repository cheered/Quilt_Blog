package com.quilt.service.impl;

import com.github.pagehelper.PageHelper;
import com.quilt.dao.*;
import com.quilt.entity.Article;
import com.quilt.entity.ArticleCategory;
import com.quilt.entity.ArticleTag;
import com.quilt.entity.ArticleWithBLOBs;
import com.quilt.service.ArticleService;
import com.quilt.utils.BeanUtil;
import com.quilt.utils.PagedResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Service
public class ArticleServiceImpl implements ArticleService {

    //注入
    @Autowired
    ArticleDAO articleDAO;

    @Autowired
    ArticleCategoryDAO articleCategoryDAO;

    @Autowired
    ArticleTagDAO articleTagDAO;

    @Autowired
    CommentDAO commentDAO;

    @Override
    public ArticleWithBLOBs getArticleById(Integer id) {

        return articleDAO.selectByPrimaryKey(id);
    }

    @Override
    public int writeArticle(ArticleWithBLOBs articleWithBLOBs,Integer[] categoryIds,Integer[] tagIds) {

        //先将文章表里的相关属性插入
        int r = articleDAO.insertArticleWithBLOBs(articleWithBLOBs);

        if(r==1){
            //如果插入成功且用户勾选了分类
            if(categoryIds != null) {

                //创建关联对象表
                List<ArticleCategory> articleCategories = new ArrayList<ArticleCategory>();
                //根据分类ID遍历用户所选的所有分类
                for (Integer id:categoryIds) {
                    //创建一个关联对象
                    ArticleCategory articleCategory = new ArticleCategory();
                    //想关联对象中插入文章ID和分类ID
                    articleCategory.setArticleId(articleWithBLOBs.getId());
                    articleCategory.setCategoryId(id);
                    //将这个关联对象插入到关联对象表里
                    articleCategories.add(articleCategory);
                }

                //将关联对象表插入到数据库里面
                articleCategoryDAO.insertArticleCategoryList(articleCategories);
            }

            if(tagIds != null){

                List<ArticleTag> articleTags = new ArrayList<ArticleTag>();
                for (Integer id : tagIds){

                    ArticleTag articleTag = new ArticleTag();
                    articleTag.setArticleId(articleWithBLOBs.getId());
                    articleTag.setTagId(id);
                    articleTags.add(articleTag);
                }

                articleTagDAO.insertArticleTagList(articleTags);
            }

            return 1;
        }

        return 0;
    }

    @Override
    public List<Article> getAllArticle() {

        // TODO
        return articleDAO.getAllArticle();
    }

    @Override
    @Transactional
    public int deleteArticle(Integer id) {

        articleTagDAO.deleteArticleTagByArticleId(id);
        articleCategoryDAO.deleteArticleCategoryByArticleId(id);

        commentDAO.deleteCommentByArticleId(id);

        return articleDAO.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int modArticle(ArticleWithBLOBs articleWithBLOBs, Integer[] categoryIds, Integer[] tagIds) {

        articleTagDAO.deleteArticleTagByArticleId(articleWithBLOBs.getId());
        articleCategoryDAO.deleteArticleCategoryByArticleId(articleWithBLOBs.getId());


        if(categoryIds != null) {

            //创建关联对象表
            List<ArticleCategory> articleCategories = new ArrayList<ArticleCategory>();

            for (Integer id:categoryIds) {

                ArticleCategory articleCategory = new ArticleCategory();
                articleCategory.setArticleId(articleWithBLOBs.getId());
                articleCategory.setCategoryId(id);
                articleCategories.add(articleCategory);

            }

            //批量插入
            articleCategoryDAO.insertArticleCategoryList(articleCategories);
        }

        if(tagIds != null){

            List<ArticleTag> articleTags = new ArrayList<ArticleTag>();
            for (Integer id : tagIds){

                ArticleTag articleTag = new ArticleTag();
                articleTag.setArticleId(articleWithBLOBs.getId());
                articleTag.setTagId(id);
                articleTags.add(articleTag);
            }

            articleTagDAO.insertArticleTagList(articleTags);
        }

        return articleDAO.updateByPrimaryKeySelective(articleWithBLOBs);

    }

    @Override
    public int getArticleCount() {
        return articleDAO.getArticleCount();
    }

    @Override
    public List<Article> getTop8Article() {
        return articleDAO.getTop8Article();
    }

    @Override
    public List<ArticleWithBLOBs> getAllArticleWithBLOBs() {
        return articleDAO.getAllArticleWithBLOBs();
    }

    @Override
    public int viewCountPlusOne(Integer articleId) {
        return articleDAO.viewCountPlusOne(articleId);
    }

    @Override
    public List<Article> getArticleListByTitle(String title) {
        return articleDAO.getArticleListByTitle(title);
    }

    @Override
    public PagedResult<ArticleWithBLOBs> getArticlePage(Integer pageNo, Integer pageSize) {

        pageNo = pageNo == null ? 1 : pageNo;

        pageSize = pageSize == null ? 1 : pageSize;

        //开始分页
        PageHelper.startPage(pageNo,pageSize);

        PagedResult<ArticleWithBLOBs> articleResult = BeanUtil.toPagedResult(articleDAO.getAllArticleWithBLOBs());

        return articleResult;
    }
}
