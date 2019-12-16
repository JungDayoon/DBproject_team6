package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.DeptDao;
import com.dbteam6.resourcesharing.model.dao.ItemDao;
import com.dbteam6.resourcesharing.model.dao.UserDao;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class UserController {
    UserDao uDao = UserDao.getInstance();
    ItemDao iDao = ItemDao.getInstance();
    /*GET USERS*/
    @ResponseBody
    @GetMapping("/users")
    public JSONArray getUsers() {
        return uDao.findAll();
    }

    @ResponseBody
    @GetMapping("/users/{uuid}")
    public JSONObject getUserById(@PathVariable("uuid") int uuid) {
        JSONArray tempArr = uDao.getUserInfoById(uuid);
        if (tempArr.isEmpty()) {
            return null;
        }
        return (JSONObject) tempArr.get(0);
    }

    @ResponseBody
    @GetMapping("/users/{uuid}/myitems")
    public JSONArray getMyItem(@PathVariable("uuid") int uuid){
        return iDao.getOnesItems(uuid);
    }

    /* CREATE USERS */
    @ResponseBody
    @PostMapping("/users/{uuid}/{uname}/{pwd}/{major}")
    public int addUser(@PathVariable("uuid") int uuid, @PathVariable("uname") String uname, @PathVariable("pwd") String pwd, @PathVariable("major") String major) {
        System.out.println("@ REQUEST : [id]" + uuid + "try to signup");
        return uDao.addUser(uuid, uname, pwd, major);
    }

    /* UPDATE USERS */
    @ResponseBody
    @PutMapping("/users/{uuid}/{field}/{new_val}")
    public int updateUser(@PathVariable("uuid") int uuid, @PathVariable("field") String field, @PathVariable("new_val") String value) {
        String condition = "uuid=" + uuid;
        System.out.println(value);
        if (field.equals("uname") || field.equals("pwd")) {
            value = "'" + value + "'";
        } else if (field.equals("admin")) {
            if (value.equals("false")) {
                value = "0";
            } else if (value.equals("true")) {
                value = "1";
            }
        } else {
            return 0;
        }
        return uDao.updateUser(condition, field, value);
    }

    /* DELETE USER */
    @ResponseBody
    @DeleteMapping("/users/{uuid}")
    public int delUser(@PathVariable("uuid") int uuid) {
        String condition = "uuid=" + uuid;
        return uDao.deleteUser(condition);
    }
}
