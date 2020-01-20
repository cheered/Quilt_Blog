package com.quilt.service.impl;

import com.quilt.dao.ArticleCategoryDAO;
import com.quilt.dao.ArticleDAO;
import com.quilt.dao.CategoryDAO;
import com.quilt.entity.Article;
import com.quilt.entity.ArticleCategory;
import com.quilt.entity.Category;
import com.quilt.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    ArticleCategoryDAO articleCategoryDAO;

    @Autowired
    ArticleDAO articleDAO;

    @Override
    public List<Category> getAllParentCategory() {
        return categoryDAO.getAllParentCategory();
    }

    @Override
    public List<Category> getAllChildCategory() {
        return categoryDAO.getAllChildCategory();
    }

    @Override
    public int addCategory(Category category) {
        return categoryDAO.insertSelective(category);
    }

    @Override
    public int modCategory(Category category) {
        return categoryDAO.updateByPrimaryKeySelective(category);
    }

    /**
     * 删除分类
     * @param id
     * @return
     */
    @Transactional
    @Override
    public int deleteCategory(Integer id) {

        List<Category> childCategory = categoryDAO.getChildCategory(id);

        //删除父分类节点时，如果有子分类节点，就不能删除
        if(childCategory.size() > 0){

            return  0;
        }

//        categoryDAO.deleteAllCategoryByPid(id);

        articleCategoryDAO.deleteArticleCategoryByCategoryId(id);

        return categoryDAO.deleteByPrimaryKey(id);
    }

    @Override
    public Category getCategory(Integer id) {

        return categoryDAO.selectByPrimaryKey(id);
    }

    @Override
    public List<Category> getCategoryListByArticleId(Integer id) {

        List<ArticleCategory> articleCategoryList = articleCategoryDAO.getArticleCategoryByArticleId(id);
        List<Category> categoryList = new ArrayList<Category>();

        for (ArticleCategory articleCategory: articleCategoryList){

            Category category = categoryDAO.selectByPrimaryKey(articleCategory.getCategoryId());
            categoryList.add(category);
        }

        return categoryList;
    }

    @Override
    public int getArticleCountByCategoryId(Integer categoryId) {
        //注意这个根据关联表获得
        return articleCategoryDAO.getArticleCountByCategoryId(categoryId);
    }

    @Override
    public List<Article> getArticleListByCategoryId(Integer categoryId) {
        return articleDAO.getArticleListByCategoryId(categoryId);
    }

    @Override
    public int getCategoryCount() {
        return categoryDAO.getCategoryCount();
    }
}
