package com.quilt.utils;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {

    /**
     * 得到IP地址
     * @param request
     * @return
     */
    public static String getClientIp(HttpServletRequest request) {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        return remoteAddr;
    }

    /**
     * 得到浏览器信息
     * @param request
     * @return
     */
    public static String getBrowserInfo(HttpServletRequest request) {
        String browserInfo = "";
        if (request != null) {
            browserInfo = request.getHeader("User-Agent");
            if (browserInfo == null || "".equals(browserInfo)) {
                browserInfo = request.getRemoteAddr();
            }
        }
        return browserInfo;
    }
}
