package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.DeptDao;
import com.dbteam6.resourcesharing.model.dao.ItemDao;
import net.minidev.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ItemController {
    ItemDao iDao = ItemDao.getInstance();
    DeptDao dDao = DeptDao.getInstance();
    /*GET*/
    @ResponseBody
    @GetMapping("/items")
    public JSONArray getItems() {
        return iDao.getAllItems();
    }

    @ResponseBody
    @GetMapping("/items/of/{category_name}")
    public JSONArray getItemsOfCategory(@PathVariable("category_name") String cname) {
        return iDao.getItemsOfCategory(cname);
    }

    @ResponseBody
    @GetMapping("/items/from/{dept_name}")
    public JSONArray getItemsOfDept(@PathVariable("dept_name") String dname){
        return iDao.getItemsOfDept(dname);
    }

//    @ResponseBody
//    @PostMapping("/items/{iname}/{cid}/by/{uuid}")
//    public JSONArray addItem(@PathVariable("iname") int iname, @PathVariable("cid") int cid, @PathVariable("uuid") int uuid){
//
//    }

}
