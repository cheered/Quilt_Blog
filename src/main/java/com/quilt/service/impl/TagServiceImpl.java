package com.quilt.service.impl;

import com.quilt.dao.ArticleDAO;
import com.quilt.dao.ArticleTagDAO;
import com.quilt.dao.TagDAO;
import com.quilt.dao.UserDAO;
import com.quilt.entity.Article;
import com.quilt.entity.ArticleTag;
import com.quilt.entity.Tag;
import com.quilt.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    TagDAO tagDAO;

    @Autowired
    ArticleTagDAO articleTagDAO;

    @Autowired
    ArticleDAO articleDAO;

    @Override
    public List<Tag> getAllTags() {
        return tagDAO.getAllTags();
    }

    @Override
    public int addTag(Tag tag) {
        return tagDAO.insertSelective(tag);
    }

    @Transactional
    @Override
    public int deleteTag(Integer id) {

        articleTagDAO.deleteArticleTagByTagId(id);

        return tagDAO.deleteByPrimaryKey(id);
    }

    @Override
    public Tag getTag(Integer id) {
        return tagDAO.selectByPrimaryKey(id);
    }

    @Override
    public int modTag(Integer id, String tagName, String fontSize, String fontColor) {
        Tag tag = new Tag();
        tag.setId(id);
        tag.setTagName(tagName);
        tag.setFontSize(fontSize);
        tag.setFontColor(fontColor);

        return tagDAO.updateByPrimaryKeySelective(tag);
    }

    @Override
    public List<Tag> getTagListByArticleId(Integer id) {

        //通过文章ID，得到对应的关联对象表
        List<ArticleTag> articleTagList = articleTagDAO.getArticleTagByArticleId(id);
        //创建一个空标签表
        List<Tag> tagList = new ArrayList<Tag>();

        for( ArticleTag articleTag : articleTagList){

            //循环关联对象，得到标签ID，再通过这个标签ID得到对应的标签
            Tag tag = tagDAO.selectByPrimaryKey(articleTag.getTagId());
            //得到标签以后放到标签表里
            tagList.add(tag);
        }

        return tagList;
    }

    @Override
    public int getTagCount() {
        return tagDAO.getTagCount();
    }

    @Override
    public List<Article> getArticleListByTagId(Integer tagId) {
        return articleDAO.getArticleListByTagId(tagId);
    }

    @Override
    public int getArticleCountByTagId(Integer tagId) {
        return articleTagDAO.getArticleCountByTagId(tagId);
    }
}
