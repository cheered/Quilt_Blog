package com.quilt.dto;

import com.quilt.entity.ArticleWithBLOBs;
import com.quilt.entity.Category;
import com.quilt.entity.Tag;

import java.util.List;

public class ArticleWithBLOBsDto {

    private ArticleWithBLOBs articleWithBLOBs;

    private List<Tag> tags;

    private List<Category> categories;

    public ArticleWithBLOBsDto(){

    }

    public ArticleWithBLOBsDto(ArticleWithBLOBs articleWithBLOBs, List<Tag> tags, List<Category> categories) {
        this.articleWithBLOBs = articleWithBLOBs;
        this.tags = tags;
        this.categories = categories;
    }

    public ArticleWithBLOBs getArticleWithBLOBs() {
        return articleWithBLOBs;
    }

    public void setArticleWithBLOBs(ArticleWithBLOBs articleWithBLOBs) {
        this.articleWithBLOBs = articleWithBLOBs;
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
