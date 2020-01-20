package com.quilt.controller.admin;

import com.quilt.dto.Result;
import com.quilt.entity.Article;
import com.quilt.entity.Comment;
import com.quilt.entity.User;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.ArticleService;
import com.quilt.service.CategoryService;
import com.quilt.service.CommentService;
import com.sun.org.apache.bcel.internal.generic.L2I;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    ArticleService articleService;

    /**
     * 渲染用户评论页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/all")
    public String getAllCommentPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        List<Comment> userComment = commentService.getAllUserComment();
        List<Article> articles = articleService.getAllArticle();

        model.addAttribute("userComment",userComment);
        model.addAttribute("articles",articles);
        model.addAttribute("commentCount",userComment.size());

        return "admin/comment";
    }

    /**
     * 渲染回复页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/reply")
    public String getReplyPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        List<Comment> allReply = commentService.getAllReply();
        List<Comment> userComment = commentService.getAllUserComment();
        List<Article> articles = articleService.getAllArticle();

        model.addAttribute("allReply",allReply);
        model.addAttribute("userComment",userComment);
        model.addAttribute("articles",articles);
        model.addAttribute("replyCount",allReply.size());

        return "admin/reply";
    }

    /**
     *渲染添加回复的页面
     * @param session
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/addreply/{id}")
    public  String getAddReplyPage(HttpSession session,Model model,
                                   @PathVariable("id") Integer id){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        Comment comment = commentService.getCommentById(id);

        model.addAttribute("comment",comment);
        model.addAttribute("user",user);

        return  "admin/add_reply";

    }


    @RequestMapping("/modreply/{id}")
    public String getModReplyPage(HttpSession session,Model model,
                                  @PathVariable("id") Integer id){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        Comment comment = commentService.getCommentById(id);
        Comment parentComment = commentService.getCommentById(comment.getCommentPid());

        model.addAttribute("comment",comment);
        model.addAttribute("parentComment",parentComment);

        return "admin/edit_reply";

    }


    @RequestMapping("/add")
    @ResponseBody
    public Result addReply(HttpSession session,
                           @RequestParam(value = "commentPid",required = false)Integer commentPid,
                           @RequestParam("commentName")String commentName,
                           @RequestParam("commentEmail") String commentEmail,
                           @RequestParam("commentContent") String commentContent,
                           @RequestParam("articleId") Integer articleId){



        Comment comment = new Comment();
        comment.setArticleId(articleId);
        comment.setCommentPid(commentPid);
        comment.setCommentName(commentName);
        comment.setCommentEmail(commentEmail);
        comment.setCommentContent(commentContent);

        int r = commentService.addComment(comment);

        if (r == 1){

            return new Result(QuiltEnums.SUCCESS);

        }

        return new Result(QuiltEnums.FAILED);
    }


    @RequestMapping("/delete/{id}")
    @ResponseBody
    public  Result deleteComment(HttpSession session,
                                 @PathVariable("id") Integer id){


        User user = (User) session.getAttribute("user");
        if(user == null){
            return new Result(QuiltEnums.FAILED);
        }

        int r = commentService.deleteComment(id);

        if(r == 1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return  new Result(QuiltEnums.FAILED);
    }


    @RequestMapping("/mod/{id}")
    @ResponseBody
    public Result modReply(HttpSession session,
                           @PathVariable("id") Integer id,
                           @RequestParam("commentContent") String commentContent){


        User user = (User) session.getAttribute("user");
        if(user == null){
            return new Result(QuiltEnums.FAILED);
        }

        Comment comment = new Comment();
        comment.setId(id);
        comment.setCommentContent(commentContent);

        int r = commentService.modComment(comment);

        if (r == 1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return  new Result(QuiltEnums.FAILED);
    }
}
