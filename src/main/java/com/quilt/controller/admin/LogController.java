package com.quilt.controller.admin;

import com.quilt.dto.Result;
import com.quilt.entity.Log;
import com.quilt.entity.User;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/log")
public class LogController {

    /**
     * 渲染日志记录页面
     * @param session
     * @param model
     * @return
     */

    @Autowired
    LogService logService;

    @RequestMapping("/index")
    public String getLogPage(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        if(user == null){

            return "redirect:/login";
        }

        List<Log> logList = logService.getAllLogRecord();
        model.addAttribute("logList",logList);

        return "admin/logs";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public Result deleteLogRecord(HttpSession session,
                                  @PathVariable("id")Integer id){

        User user = (User) session.getAttribute("user");
        if(user == null){
            return new Result(QuiltEnums.FAILED);
        }

        int r = logService.deleteLogRecrd(id);

        if(r==1){

            return new Result(QuiltEnums.SUCCESS);
        }

        return new Result(QuiltEnums.FAILED);
    }
}
