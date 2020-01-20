package com.quilt.controller.admin;

import com.quilt.entity.User;
import com.quilt.entity.Visitor;
import com.quilt.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/visitor")
public class VistitorController {

    @Autowired
    VisitorService visitorService;

    /**
     * 渲染访客记录页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String getVisitorPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        List<Visitor> visitorList = visitorService.getAllVisitorRecord();
        model.addAttribute("visitorList",visitorList);

        return "admin/visitor";
    }
}
