package com.quilt.service;

import com.quilt.entity.Article;
import com.quilt.entity.Category;

import java.util.List;


public interface CategoryService {

    /**
     * 获取所有父分类标签
     * @return
     */
    List<Category> getAllParentCategory();

    /**
     * 获取所有子分类标签
     * @return
     */
    List<Category> getAllChildCategory();

    /**
     * 添加标签
     * @param category
     * @return
     */
    int addCategory(Category category);

    /**
     * 编辑标签
     * @param category
     * @return
     */
    int modCategory(Category category);

    /**
     * 删除标签
     * @param id
     * @return
     */
    int deleteCategory(Integer id);

    /**
     * 获取特定标签
     * @param id
     * @return
     */
    Category getCategory(Integer id);

    /**
     * 根据文章ID获取分类列表
     */

    List<Category> getCategoryListByArticleId(Integer id);

    int getArticleCountByCategoryId(Integer categoryId);

    List<Article> getArticleListByCategoryId(Integer categoryId);

    int getCategoryCount();

}
