package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.CategoryDao;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;

@Controller
public class CategoryController {
    CategoryDao cDao = CategoryDao.getInstance();

    /*GET CATEGORY*/
    @ResponseBody
    @GetMapping("/categories")
    public JSONArray getCategories() throws SQLException {
        return cDao.findAll();
    }


}



