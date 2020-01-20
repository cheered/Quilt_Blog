package com.quilt.service;

import com.quilt.entity.User;
import com.quilt.entity.UserWithBLOBs;
import com.quilt.exception.QuiltException;

import javax.servlet.http.HttpSession;

public interface UserService {

    /**
     * 用户登陆校验
     * @param username
     * @param password
     * @return
     * @throws QuiltException
     */
    User login(String username,String password) throws QuiltException;

    /**
     * 修改用户名和密码
     * @param user
     * @param nowPass
     * @param newPass
     * @param newName
     * @return
     * @throws QuiltException
     */

    User modPasswordAndUsername(User user,String nowPass, String newPass, String newName) throws QuiltException;

    /**
     * 通过用户id获得用户
     * @param id
     * @return
     */

    UserWithBLOBs getUserInfoById(Integer id);

    /**
     * 修改用户信息
     * @param userWithBLOBs
     * @return
     */
    int modUserInfo(UserWithBLOBs userWithBLOBs);



}
