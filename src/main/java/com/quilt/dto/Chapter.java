package com.quilt.dto;

public class Chapter {

    private String chapterId;

    private Integer chapterNum;

    private String chapterName;

    public Chapter() {
    }

    public Chapter(String chapterId, Integer chapterNum, String chapterName) {
        this.chapterId = chapterId;
        this.chapterNum = chapterNum;
        this.chapterName = chapterName;
    }

    public String getChapterId() {
        return chapterId;
    }

    public void setChapterId(String chapterId) {
        this.chapterId = chapterId;
    }

    public Integer getChapterNum() {
        return chapterNum;
    }

    public void setChapterNum(Integer chapterNum) {
        this.chapterNum = chapterNum;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }
}
