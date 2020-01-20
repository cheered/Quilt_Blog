package com.quilt.controller;

import com.quilt.dto.Result;
import com.quilt.entity.Log;
import com.quilt.entity.User;
import com.quilt.exception.QuiltException;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.LogService;
import com.quilt.service.UserService;
import com.quilt.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @Autowired
    LogService logService;

    @RequestMapping("/login")
    public String getLoginPage(){
        return "login";
    }

    @RequestMapping("/admin")
    public String getLoginPage2(){
        return "login";
    }

    @RequestMapping("/login/check")
    @ResponseBody
    public Result loginCheck(HttpServletRequest servletRequest, HttpSession session, String username, String password){

        try {

            User user = userService.login(username, password);

            if (user == null) {

                Log log = new Log();
                log.setIp(WebUtils.getClientIp(servletRequest));
                log.setLogDetail("登录失败");
                log.setLogType("登录");
                logService.addLogRecord(log);

                return new Result(QuiltEnums.FAILED);


            } else {
                session.setAttribute("user", user);

                Log log = new Log();
                log.setIp(WebUtils.getClientIp(servletRequest));
                log.setLogDetail("登录成功");
                log.setLogType("登录");
                logService.addLogRecord(log);

                return new Result(QuiltEnums.SUCCESS);
            }
        }catch (QuiltException qe){
            return new Result(qe.getQuiltEnums());
        }
    }
}
