package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.DeptDao;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;

@Controller
public class DeptController {
    DeptDao dDao = DeptDao.getInstance();

    /*GET DEPT*/
    @ResponseBody
    @GetMapping("/depts")
    public JSONArray getDepts() {
        return dDao.findAll();
    }

    @ResponseBody
    @GetMapping("/depts/{did}")
    public JSONObject getDeptById(@PathVariable("did") int did){
        JSONArray tempArr = dDao.findByCondition("did = " + did);
        if (tempArr.isEmpty()){
            return null;
        }
        return (JSONObject) tempArr.get(0);
    }
    @ResponseBody
    @GetMapping("/depts/have/{category_name}")
    public JSONArray getDeptOfCategory(@PathVariable("category_name") String cname) throws SQLException {
        JSONArray depts = dDao.getDeptOfCategories(cname);
        return depts;
    }


}



