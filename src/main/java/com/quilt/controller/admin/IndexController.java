package com.quilt.controller.admin;

import com.quilt.entity.Article;
import com.quilt.entity.Comment;
import com.quilt.entity.Log;
import com.quilt.entity.User;
import com.quilt.service.ArticleService;
import com.quilt.service.CommentService;
import com.quilt.service.LogService;
import com.quilt.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class IndexController {

    @Autowired
    ArticleService articleService;

    @Autowired
    CommentService commentService;

    @Autowired
    TagService tagService;

    @Autowired
    LogService logService;

    @RequestMapping("/index")
    public String getIndexPage(HttpSession session, Model model){

        User user = (User)session.getAttribute("user");

        if(user == null){
            return  "redirect:/login";
        }

        model.addAttribute("user",user);

        return "admin/index";
    }


    @RequestMapping("/console")
    public  String getConsolePage(HttpSession session, Model model){

        User user = (User)session.getAttribute("user");

        if(user == null){
            return  "redirect:/login";
        }

        int articleCount = articleService.getArticleCount();
        List<Article> articleList = articleService.getTop8Article();

        int commentCount = commentService.getCommentCount();
        List<Comment> commentList = commentService.getTop8Comment();

        int tagCount = tagService.getTagCount();

        int logCount = logService.getLogCount();
        List<Log> logList = logService.getTop8Log();

        model.addAttribute("articleCount",articleCount);
        model.addAttribute("articleList",articleList);
        model.addAttribute("commentCount",commentCount);
        model.addAttribute("commentList",commentList);
        model.addAttribute("tagCount",tagCount);
        model.addAttribute("logCount",logCount);
        model.addAttribute("logList",logList);

        return "admin/console";
    }
}
