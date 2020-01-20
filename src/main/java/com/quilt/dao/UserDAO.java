package com.quilt.dao;

import com.quilt.entity.User;
import com.quilt.entity.UserWithBLOBs;

public interface UserDAO {
    /**
     * 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 
     */
    int insert(UserWithBLOBs record);

    /**
     * 
     */
    int insertSelective(UserWithBLOBs record);

    /**
     * 
     */
    UserWithBLOBs selectByPrimaryKey(Integer id);

    /**
     * 
     */
    int updateByPrimaryKeySelective(UserWithBLOBs record);

    /**
     * 
     */
    int updateByPrimaryKeyWithBLOBs(UserWithBLOBs record);

    /**
     * 
     */
    int updateByPrimaryKey(User record);

    /**
     * 根据用户名获取用户
     * @param username
     * @return
     */
    User selectUserByUsername(String username);


}