package com.test;

import com.quilt.dao.ArticleDAO;
import com.quilt.entity.ArticleWithBLOBs;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class ArticleTest {

    @Autowired
    ArticleDAO articleDAO;

    @Test
    public void test(){

        ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
        articleWithBLOBs.setTitle("test");
        articleWithBLOBs.setUserId(1);
        articleWithBLOBs.setArticleType(0);
        articleWithBLOBs.setIssueType(0);

        System.out.println(articleWithBLOBs.getId());

        int r = articleDAO.insertArticleWithBLOBs(articleWithBLOBs);

        System.out.println(articleWithBLOBs.getId());







    }

}
