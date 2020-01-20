package com.quilt.controller.admin;

import com.quilt.dto.Result;
import com.quilt.entity.Tag;
import com.quilt.entity.User;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.TagService;
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
public class TagController {

    @Autowired
    TagService tagService;

    /**
     * 渲染标签页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/tag")
    public String getTagPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if ( user == null ){

            return "redirect:/login";
        }

        //key的值为标签ID，value的值为对应的文章数量
        Map<Integer,Integer> tagIdAndArticleCount = new HashMap<Integer, Integer>();
        List<Tag> tagList = tagService.getAllTags();

        for (Tag tag : tagList){

            tagIdAndArticleCount.put(tag.getId(),tagService.getArticleCountByTagId(tag.getId()));

        }

        model.addAttribute("tagIdAndArticleCount",tagIdAndArticleCount);
        model.addAttribute("tagList",tagList);

        return "admin/tag";
    }

    /**
     * 删除标签
     * @param session
     * @param id
     * @return
     */
    @RequestMapping("/tag/delete/{id}")
    @ResponseBody
    public Result deleteTag(HttpSession session,@PathVariable("id" ) Integer id){

        User user = (User) session.getAttribute("user");
        if ( user == null ){

            return new Result(QuiltEnums.FAILED);

        }

        int r = tagService.deleteTag(id);
        if( r==1 ){

            return new Result(QuiltEnums.SUCCESS);
        }

        return new Result(QuiltEnums.FAILED);

    }

    /**
     * 添加标签
     * @param session
     * @param tagName
     * @param fontSize
     * @param fontColor
     * @return
     */
    @RequestMapping("/tag/add")
    @ResponseBody
    public Result deleteTag(HttpSession session,
                            @RequestParam("tagName") String tagName,
                            @RequestParam("fontSize") String fontSize,
                            @RequestParam("fontColor") String fontColor ){

        User user = (User) session.getAttribute("user");
        if ( user == null ){

            return new Result(QuiltEnums.FAILED);

        }

        Tag tag = new Tag();
        tag.setTagName(tagName);
        tag.setFontSize(fontSize);
        tag.setFontColor(fontColor);

        int r = tagService.addTag(tag);

        if( r==1 ){

            return new Result(QuiltEnums.SUCCESS);
        }
        return new Result(QuiltEnums.FAILED);
    }

    /**
     * 小页面的渲染
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/tag/edit_tag")
    public String editTag(@RequestParam("id")Integer id,Model model){

        Tag tag = tagService.getTag(id);
        model.addAttribute("tag",tag);

        return "admin/edit_tag";
    }

    /**
     * 编辑标签
     * @param session
     * @param id
     * @param tagName
     * @param fontSize
     * @param fontColor
     * @return
     */
    @RequestMapping("/tag/mod/{id}")
    @ResponseBody
    public Result modTag(HttpSession session,
                            @PathVariable("id") Integer id,
                            @RequestParam("tagName") String tagName,
                            @RequestParam("fontSize") String fontSize,
                            @RequestParam("fontColor") String fontColor ){

        User user = (User) session.getAttribute("user");
        if ( user == null ){
            return new Result(QuiltEnums.FAILED);
        }

        int r = tagService.modTag(id, tagName, fontSize, fontColor);

        if( r==1 ){

            return new Result(QuiltEnums.SUCCESS);
        }
        return new Result(QuiltEnums.FAILED);
    }

}
