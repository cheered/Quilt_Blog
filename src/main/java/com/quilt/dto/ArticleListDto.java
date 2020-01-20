package com.quilt.dto;

import com.quilt.entity.Article;
import com.quilt.entity.Category;
import com.quilt.entity.Tag;

import java.util.List;

public class ArticleListDto {

    private Article article;

    private List<Tag> tags;

    private List<Category> categories;

    public ArticleListDto() {

    }

    public ArticleListDto(Article article, List<Tag> tags, List<Category> categories) {
        this.article = article;
        this.tags = tags;
        this.categories = categories;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }
}
