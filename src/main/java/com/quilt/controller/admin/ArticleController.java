package com.quilt.controller.admin;

import com.quilt.dto.ArticleListDto;
import com.quilt.dto.Result;
import com.quilt.entity.*;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.ArticleService;
import com.quilt.service.CategoryService;
import com.quilt.service.TagService;
import com.quilt.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/article")
public class ArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    TagService tagService;

    /**
     * 渲染所有文章页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/all")
    public String getAllArticlesPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        List<Article> articleList = articleService.getAllArticle();

        List<ArticleListDto> articleListDtoList = new ArrayList<ArticleListDto>();

        for (Article article:articleList){

            List<Tag> tags = tagService.getTagListByArticleId(article.getId());
            List<Category> categories = categoryService.getCategoryListByArticleId(article.getId());
            ArticleListDto articleListDto = new ArticleListDto(article,tags,categories);
            articleListDtoList.add(articleListDto);

        }

        model.addAttribute("articleListDtoList",articleListDtoList);

        return "admin/all_articles";
    }

    /**
     * 渲染写文章页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/write")
    public String getWriteArticlePage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        List<Category> parentCategoryList = categoryService.getAllParentCategory();
        List<Category> childCategoryList = categoryService.getAllChildCategory();
        List<Tag> tagList = tagService.getAllTags();

        model.addAttribute("parentCategoryList",parentCategoryList);
        model.addAttribute("childCategoryList",childCategoryList);
        model.addAttribute("tagList",tagList);

        return  "admin/write_articles";
    }

    /**
     * 写文章
     * @param session
     * @param articleTitle 文章标题
     * @param markdownContent markdown文本
     * @param htmlContent markdown的html显示
     * @param articleImage 文章图片
     * @param articleType 文章类型
     * @param issueType 发布类型
     * @param articleCategoryId 关联表的分类id
     * @param articleTagId 关联表的标签id
     * @return
     */
    @RequestMapping("/write/new")
    @ResponseBody
    public Result writeNewArticle(HttpSession session,
                                  // @RequestParam 简单参数类型的绑定 required=true 指定的参数必须传入
                                  @RequestParam("articleTitle") String articleTitle,
                                  @RequestParam(value = "markdownContent",required = false)String markdownContent,
                                  @RequestParam(value = "htmlContent",required = false) String htmlContent,
                                  @RequestParam(value = "articleImage" ,required = false)MultipartFile articleImage,
                                  @RequestParam("articleType")Integer articleType,
                                  @RequestParam("issueType") Integer issueType,
                                  @RequestParam(value = "articleCategoryId", required = false) Integer[] articleCategoryId,
                                  @RequestParam(value = "articleTagId" ,required = false) Integer[] articleTagId){

        User user = (User) session.getAttribute("user");
        if(user == null){
            return new Result(QuiltEnums.FAILED);
        }

        try {

            //创建一个文章对象，并注入前台传过来的相关的值
            ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
            articleWithBLOBs.setUserId(user.getId());
            articleWithBLOBs.setIssueType(issueType);
            articleWithBLOBs.setArticleType(articleType);
            articleWithBLOBs.setTitle(articleTitle);
            articleWithBLOBs.setHtmlContent(htmlContent);
            articleWithBLOBs.setMarkdownContent(markdownContent);

            if(articleImage != null && articleImage.getSize() > 0){
                //调用图片上传的工具类
                articleWithBLOBs.setArticlePic(FileUploadUtil.saveBgPic(session,articleImage));
            }
             //调用service的写文章方法
            int r = articleService.writeArticle(articleWithBLOBs,articleCategoryId,articleTagId);

            if(r == 1){
                return new Result(QuiltEnums.SUCCESS);
            }

            return  new Result(QuiltEnums.FAILED);

        }catch (IOException e){
            return  new Result(QuiltEnums.FAILED);
        }

    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public Result deleteArticle(HttpSession session,
                                @PathVariable("id") Integer id){

        User user = (User) session.getAttribute("user");
        if(user == null || id <= 0){
            return new Result(QuiltEnums.FAILED);
        }

        int r = articleService.deleteArticle(id);

        if (r == 1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return new Result(QuiltEnums.FAILED);
    }

    @RequestMapping("/edit/{id}")
    public String getEditArticlePage(HttpSession session,
                                     @PathVariable("id")Integer id,
                                     Model model){

        User user = (User) session.getAttribute("user");
        if(user == null || id <= 0){
            return "redirect:/login";
        }

        //通过ID获取这个文章对象
        ArticleWithBLOBs articleWithBLOBs = articleService.getArticleById(id);

        //获取文章所关联的所有标签和分类

        List<Tag> tags = tagService.getTagListByArticleId(id);
        List<Category> categories = categoryService.getCategoryListByArticleId(id);

        //获取所有标签和分类

        List<Tag> tagList = tagService.getAllTags();
        List<Category> parentCategoryList = categoryService.getAllParentCategory();
        List<Category> childCategoryList = categoryService.getAllChildCategory();
        //将数据渲染到页面上
        model.addAttribute("articleWithBLOBs",articleWithBLOBs);
        model.addAttribute("tags",tags);
        model.addAttribute("categories",categories);
        model.addAttribute("tagList",tagList);
        model.addAttribute("parentCategoryList",parentCategoryList);
        model.addAttribute("childCategoryList",childCategoryList);

        return  "admin/edit_articles";
    }


    //编辑文章
    @RequestMapping("/mod/{id}")
    @ResponseBody
    public Result modArticle(HttpSession session,
                             @PathVariable("id") Integer id,
                             @RequestParam("articleTitle") String articleTitle,
                             @RequestParam(value = "markdownContent",required = false)String markdownContent,
                             @RequestParam(value = "htmlContent",required = false) String htmlContent,
                             @RequestParam(value = "articleImage" ,required = false)MultipartFile articleImage,
                             @RequestParam("articleType")Integer articleType,
                             @RequestParam("issueType") Integer issueType,
                             @RequestParam(value = "articleCategoryId", required = false) Integer[] articleCategoryId,
                             @RequestParam(value = "articleTagId" ,required = false) Integer[] articleTagId){

        User user = (User) session.getAttribute("user");
        if(user == null){
            return new Result(QuiltEnums.FAILED);
        }

        try {

            ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
            articleWithBLOBs.setId(id);
            articleWithBLOBs.setUserId(user.getId());
            articleWithBLOBs.setIssueType(issueType);
            articleWithBLOBs.setArticleType(articleType);
            articleWithBLOBs.setTitle(articleTitle);
            articleWithBLOBs.setHtmlContent(htmlContent);
            articleWithBLOBs.setMarkdownContent(markdownContent);

            if(articleImage != null && articleImage.getSize() > 0){
                articleWithBLOBs.setArticlePic(FileUploadUtil.saveBgPic(session,articleImage));
            }

            int r = articleService.modArticle(articleWithBLOBs,articleCategoryId,articleTagId);

            if(r == 1){
                return new Result(QuiltEnums.SUCCESS);
            }

            return  new Result(QuiltEnums.FAILED);

        }catch (IOException e){

            return  new Result(QuiltEnums.FAILED);
        }
    }

}
