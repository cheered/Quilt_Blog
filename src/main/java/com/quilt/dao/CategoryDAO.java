package com.quilt.dao;

import com.quilt.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryDAO {
    /**
     * 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 
     */
    int insert(Category record);

    /**
     * 
     */
    int insertSelective(Category record);

    /**
     * 
     */
    Category selectByPrimaryKey(Integer id);

    /**
     * 
     */
    int updateByPrimaryKeySelective(Category record);

    /**
     * 
     */
    int updateByPrimaryKey(Category record);


    List<Category> getAllParentCategory();

    List<Category> getAllChildCategory();

    /**
     * 通过父节点删除其下所有节点
     * @return
     */
    int deleteAllCategoryByPid(@Param("id") Integer id);


    List<Category> getChildCategory(Integer id);


    int getCategoryCount();
}