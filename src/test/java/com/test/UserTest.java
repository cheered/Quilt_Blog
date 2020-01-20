package com.test;


import com.quilt.dao.UserDAO;
import com.quilt.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring.xml")
public class UserTest {

    @Autowired
    private UserDAO userDAO;

    @Test
    public void test(){
        User user = userDAO.selectByPrimaryKey(1);
        System.out.println(user.toString());
    }

}
