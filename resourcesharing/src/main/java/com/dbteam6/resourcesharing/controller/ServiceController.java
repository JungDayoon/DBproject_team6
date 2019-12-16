package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.UserDao;
import net.minidev.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ServiceController {
    /* Sign in */
    @ResponseBody
    @PostMapping("/services/login/{id}/{pw}")
    public boolean validLogin(@PathVariable("id") int id, @PathVariable("pw") String pw) {
        System.out.println("@ REQUEST : [id]" + id + "try to login by [pw] " + pw);
        String condition = "uuid=" + id + " and pwd='" + pw + "'";
        JSONArray result = UserDao.getInstance().findByCondition(condition);
        if (result.size() == 1) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/services/checkdup/{id}")
    public boolean checkDup(@PathVariable("id") int id){
        String condition = "uuid=" + id;
        JSONArray result = UserDao.getInstance().findByCondition(condition);
        if (result.size() != 0) {
            return true;
        }
        return false;
    }
}
