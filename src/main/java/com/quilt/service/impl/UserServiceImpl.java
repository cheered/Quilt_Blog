package com.quilt.service.impl;

import com.quilt.dao.UserDAO;
import com.quilt.entity.User;
import com.quilt.entity.UserWithBLOBs;
import com.quilt.exception.QuiltException;
import com.quilt.exception.enums.QuiltEnums;
import com.quilt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    /**
     * 登陆验证
     * @param username
     * @param password
     * @return
     * @throws QuiltException
     */

    @Override
    public User login(String username, String password) throws QuiltException {

        User user = userDAO.selectUserByUsername(username) ;

        if (user == null){
            throw new QuiltException(QuiltEnums.FAILED);
        }

            // 校验密码
            if (user.getPassword().equals(password)){
                return user;
            }

        return null;
    }

    /**
     * 修改用户密码
     * @param user
     * @param nowPass
     * @param newPass
     * @param newName
     * @return
     * @throws QuiltException
     */

    @Override
    public User modPasswordAndUsername(User user, String nowPass, String newPass, String newName) throws QuiltException {

        //校验密码 如果不相等，抛出异常
        if(!user.getPassword().equals(nowPass)){
            throw  new QuiltException(QuiltEnums.PASSWORDERROR);
        }

        //如果相等  更新信息
        UserWithBLOBs newUser = new UserWithBLOBs();
        newUser.setId(user.getId());
        newUser.setUsername(newName);
        newUser.setPassword(newPass);

        //通过userDao对象调用更新信息方法
        int r = userDAO.updateByPrimaryKeySelective(newUser);
        if(r == 0){
            throw new QuiltException(QuiltEnums.FAILED);
        }

        //通过userDao 获得更新后的对象并返回
        return userDAO.selectByPrimaryKey(user.getId());
    }

    @Override
    public UserWithBLOBs getUserInfoById(Integer id) {
        return userDAO.selectByPrimaryKey(id);
    }

    @Override
    public int modUserInfo(UserWithBLOBs userWithBLOBs) {
        return userDAO.updateByPrimaryKeySelective(userWithBLOBs);
    }
}

