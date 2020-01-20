package com.quilt.service;

import com.quilt.entity.Article;
import com.quilt.entity.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TagService {

    /**
     * 获得所有标签
     */
    List<Tag> getAllTags();

    /**
     * 添加标签
     */
    int addTag(Tag tag);

    /**
     * 删除标签
     */
    int deleteTag(Integer id);

    /**
     * 根据ID获取单个标签
     */
    Tag getTag(Integer id);


    /**
     * 编辑标签
     */
    int  modTag(Integer id,String tagName ,String fontSize,String fontColor);

    /**
     * 根据文章ID获得标签列表
     */

    List<Tag> getTagListByArticleId(Integer id);

    /**
     * 得到标签总数
     * @return
     */
    int getTagCount();

    List<Article> getArticleListByTagId(Integer tagId);

    /**
     * 根据标签ID获得文章数量
     * @param tagId
     * @return
     */
    int getArticleCountByTagId(Integer tagId);

}
