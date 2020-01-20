package com.quilt.controller.admin;

import com.quilt.dao.UserDAO;
import com.quilt.dto.Result;
import com.quilt.entity.User;
import com.quilt.entity.UserWithBLOBs;
import com.quilt.exception.QuiltException;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.UserService;
import com.quilt.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 渲染用户个人资料页
     */
    @RequestMapping("/info")
    public String getUserInfoPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        UserWithBLOBs userWithBLOBs = userService.getUserInfoById(user.getId());
        model.addAttribute("user",userWithBLOBs);
        return "admin/user_info";
    }

    /**
     * 跳转到修改密码页
     */
    @RequestMapping("/password")
    public String getModifyPasswordPage(HttpSession session, Model model){

        return "admin/mod_password";

    }

    /**
     * 用户登出
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //先获取当前用户
        User user =(User)session.getAttribute("user");
        //如果当前用户存在，移除
        if(user != null){
            //remove 是清空session里的信息
            //incalidate 是直接干掉这个session
            session.removeAttribute("user");
            //session.invalidate();
        }

        return "redirect:/login";
    }

    /**
     * 修改密码
     */
    @RequestMapping("/password/mod")
    @ResponseBody
    public Result modPasswordAndUsername(HttpSession session,
                                         @RequestParam("newName") String newName,
                                         @RequestParam("newPass") String newPass,
                                         @RequestParam("nowPass") String nowPass){

        User user = (User)session.getAttribute("user");
        if(user == null){
            return new Result(QuiltEnums.FAILED);
        }


        //处理抛出的异常
        try {

            User newUser = userService.modPasswordAndUsername(user,nowPass,newPass,newName);

            if(newUser == null){
                return new Result(QuiltEnums.FAILED);
            }
            //修改成功,更新session里的数据
            session.setAttribute("user",newUser);
            return  new Result(QuiltEnums.SUCCESS);

        }catch (QuiltException qe){

            return new Result(qe.getQuiltEnums());
        }

    }

    /**
     * 修改用户资料
     */
    @RequestMapping("/info/mod")
    @ResponseBody
    public Result modUserInfo(HttpSession session,
                              @RequestParam("headPic") MultipartFile headPic,
                              @RequestParam("userNickname") String userNickname,
                              @RequestParam("userSignature") String userSignature,
                              @RequestParam("userEmail") String userEmail,
                              @RequestParam("markdownContent") String markdownContent,
                              @RequestParam("htmlContent") String htmlContent,
                              @RequestParam("userTag") String userTag) {

        User user = (User)session.getAttribute("user");
        if ( user == null ){
            return new Result(QuiltEnums.FAILED);
        }

        UserWithBLOBs userWithBLOBs = new UserWithBLOBs();
        userWithBLOBs.setId(user.getId());
        userWithBLOBs.setUserNickname(userNickname);
        userWithBLOBs.setUserSignature(userSignature);
        userWithBLOBs.setUserEmail(userEmail);
        userWithBLOBs.setUserTag(userTag);
        userWithBLOBs.setMarkdownContent(markdownContent);
        userWithBLOBs.setHtmlContent(htmlContent);

        try {

            if (headPic != null && headPic.getSize() >0){

                userWithBLOBs.setHeadPic(FileUploadUtil.saveHeadPic(session,headPic));

            }

            int r = userService.modUserInfo(userWithBLOBs);

            if (r == 1){

                return new Result(QuiltEnums.SUCCESS);
            }

            return new Result(QuiltEnums.FAILED);

        }catch (IOException e){

            return new Result(QuiltEnums.FAILED);
        }



    }


}
