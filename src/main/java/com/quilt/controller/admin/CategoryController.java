package com.quilt.controller.admin;

import com.quilt.dto.Result;
import com.quilt.entity.Category;
import com.quilt.entity.User;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/article")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    /**
     * 渲染页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/category")
    public String getCategoryPage(HttpSession session, Model model){

        User user = (User)session.getAttribute("user");
        if( user == null){
            return "redirect:/login";
        }

        List<Category> categoryParentList = categoryService.getAllParentCategory();
        List<Category> categoryChildList = categoryService.getAllChildCategory();
        //key 为分类的ID，value 为对应的文章数量
        Map<Integer,Integer> categoryIdAndArticleCount = new HashMap<Integer, Integer>();

        for(Category categoryParent : categoryParentList){

            categoryIdAndArticleCount.put(categoryParent.getId(),categoryService.getArticleCountByCategoryId(categoryParent.getId()));
        }

        for (Category categoryChild : categoryChildList){

            categoryIdAndArticleCount.put(categoryChild.getId(),categoryService.getArticleCountByCategoryId(categoryChild.getId()));
        }

        model.addAttribute("categoryIdAndArticleCount",categoryIdAndArticleCount);
        model.addAttribute("categoryParentList",categoryParentList);
        model.addAttribute("categoryChildList",categoryChildList);

        return "admin/category";
    }

    /**
     * 添加评论
     * @param session
     * @param categoryName
     * @param categoryPid
     * @param categoryDescription
     * @return
     */
    @RequestMapping("/category/add")
    @ResponseBody
    public Result addCategory(HttpSession session,
                              @RequestParam("categoryName") String categoryName,
                              @RequestParam("categoryPid") Integer categoryPid,
                              @RequestParam("categoryDescription") String categoryDescription){

        User user = (User)session.getAttribute("user");
        if( user == null){
            return new Result(QuiltEnums.FAILED);
        }

        Category category  = new Category();
        category.setCategoryPid(categoryPid);
        category.setCategoryName(categoryName);
        category.setCategoryDescription(categoryDescription);

        int r = categoryService.addCategory(category);

        if (r == 1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return new Result(QuiltEnums.FAILED);

    }

    /**
     * 渲染小页面
     * @param session
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/category/edit_category")
    public String editCategory(HttpSession session, Model model,
                               @RequestParam("id") Integer id){
        User user = (User)session.getAttribute("user");
        if( user == null){
            return "redirect:/login";
        }

        Category category =categoryService.getCategory(id);
        List<Category> categoryParentList = categoryService.getAllParentCategory();
        model.addAttribute("category",category);
        model.addAttribute("categoryParentList",categoryParentList);

        return "admin/edit_category";

    }

    @RequestMapping("/category/mod/{id}")
    @ResponseBody
    public Result modCategory(HttpSession session,
                              @PathVariable("id") Integer categoryId,
                              @RequestParam("categoryName") String categoryName,
                              @RequestParam(value = "categoryPid", required=false) Integer categoryPid,
                              @RequestParam("categoryDescription") String categoryDescription){

        User user = (User)session.getAttribute("user");
        if( user == null){
            return new Result(QuiltEnums.FAILED);
        }


        Category category = new Category();
        category.setId(categoryId);
        category.setCategoryPid(categoryPid);
        category.setCategoryName(categoryName);
        category.setCategoryDescription(categoryDescription);

        int r = categoryService.modCategory(category);

        if (r == 1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return new Result(QuiltEnums.FAILED);

    }

    @RequestMapping("/category/delete/{id}")
    @ResponseBody
    public Result deleteCategory(HttpSession session,
                              @PathVariable("id") Integer categoryId){

        User user = (User)session.getAttribute("user");
        if( user == null){
            return new Result(QuiltEnums.FAILED);
        }

        int r = categoryService.deleteCategory(categoryId);

        if (r == 1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return new Result(QuiltEnums.FAILED);

    }
}
