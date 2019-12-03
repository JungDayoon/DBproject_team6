package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.UserDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    UserDao uDao = new UserDao();

    /*GET USERS*/
    @GetMapping("/users")
    public String getUsers(HttpServletRequest req, HttpServletResponse res){
        if (req.getParameter("uuid")){

        }
        return req.getParameter("uuid");
    }

}
