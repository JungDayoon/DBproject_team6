package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.DeptDao;
import com.dbteam6.resourcesharing.model.dao.ItemDao;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@Controller
public class ItemController {
    ItemDao iDao = ItemDao.getInstance();
    /*GET*/
    @ResponseBody
    @GetMapping("/items")
    public JSONArray getItems() throws SQLException {
        System.out.println("@ REQUEST : GET ALL ITEMS");
        return iDao.getAllItems();
    }
    @ResponseBody
    @GetMapping("/items/{uuid}/{iid}")
    public JSONObject getOnesItemById(@PathVariable("uuid") int uuid, @PathVariable("iid") int iid) throws SQLException {
        System.out.println("@ GET : GET BORROWED ITEM BY ID");
        JSONArray items = iDao.getOnesItemById(uuid, iid);
        if (items.size() == 0){
            return null;
        } else{
            return (JSONObject) items.get(0);
        }
    }

    @ResponseBody
    @GetMapping("/items/of/{category_name}")
    public JSONArray getItemsOfCategory(@PathVariable("category_name") String cname) throws SQLException {
        System.out.println("@ GET : GET ITEM OBY CATEGORY NAME");
        return iDao.getItemsOfCategory(cname);
    }

    @ResponseBody
    @GetMapping("/items/from/{dept_name}")
    public JSONArray getItemsOfDept(@PathVariable("dept_name") String dname) throws SQLException {
        return iDao.getItemsOfDept(dname);
    }

    @ResponseBody
    @PostMapping("/items/add/{iname}/{dname}/{cname}/{count}")
    public boolean addItem(@PathVariable("iname") String iname, @PathVariable("dname") String dname, @PathVariable("cname") String cname, @PathVariable("count") int count) throws SQLException {
        System.out.println("@ POST : ADD ITEM");
        return iDao.addItem(iname, dname, cname, count);
    }

    @ResponseBody
    @PutMapping("/items/update/{iid}/{newCount}")
    public boolean updateItem(@PathVariable("iid") int iid, @PathVariable("newCount") int newCount) throws SQLException {
        return iDao.updateItem(iid, newCount);
    }
    @ResponseBody
    @DeleteMapping("/items/return/{iid}/of/{uuid}")
    public boolean returnItem(@PathVariable("iid") int iid, @PathVariable("uuid") int uuid) throws SQLException {
        return iDao.returnItem(uuid, iid);
    }
}
