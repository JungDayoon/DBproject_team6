package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.dto.ItemDto;
import com.dbteam6.resourcesharing.model.dto.UserDto;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemDao extends Dao {
    private static ItemDao instance = null;

    private ItemDao() {
        super();
        System.out.println("ItemDao's JDBC driver is found");
    }

    public static ItemDao getInstance() {
        if (instance == null) {
            instance = new ItemDao();
        }
        return instance;
    }

    private JSONArray executeQuery(String query) {
        JSONArray jsonResults = new JSONArray();
        try {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                ItemDto item = new ItemDto(rs.getInt("iid"), rs.getString("iname"), rs.getInt("category_cid"), rs.getInt("remain_count"), rs.getInt("did"));
                jsonResults.add(item.toJSONObject());
            }
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (" + query + ") : " + e.getMessage());
        }
        return jsonResults;
    }

    public JSONArray findAll() {
        String query = "SELECT * FROM item";
        return executeQuery(query);
    }

    public JSONArray findByCondition(String condition) {
        String query = "SELECT * FROM item WHERE " + condition;
        return executeQuery(query);
    }

    public JSONArray getOnesItems(int uuid) {
        JSONArray items = new JSONArray();
        String query = "SELECT i.iname, d.dname ,b.count, b.start_date, b.end_date " +
                "FROM borrow b, item i, department d " +
                "WHERE b.borrow_uuid = " + uuid + " and b.borrow_iid = i.iid and d.did = i.did";
        try {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                JSONObject eachItem = new JSONObject();
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("count", rs.getInt("count"));
                eachItem.put("start_date", rs.getString("start_date"));
                eachItem.put("end_date", rs.getString("end_date"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getOnesItem fail) :" + e.getMessage());
        }


        return items;
    }


    public JSONArray getItemsOfCategory(String cname) {
        JSONArray items = new JSONArray();
        String query = "SELECT d.dname, i.iname, i.remain_count " +
                "FROM DEPARTMENT d, CATEGORY c, ITEM i " +
                "WHERE c.cid = i.category_cid and i.did = d.did and c.cname='" + cname + "'";
        try {
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                JSONObject eachItem= new JSONObject();
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("count", rs.getInt("remain_count"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getItemsOfCategory) : " + e.getMessage());
        }
        return items;
    }

    public JSONArray getAllItems(){
        JSONArray items = new JSONArray();
        String query = "SELECT d.dname, i.iname, i.remain_count " +
                "FROM DEPARTMENT d, ITEM i " +
                "WHERE i.did = d.did";
        try {
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                JSONObject eachItem= new JSONObject();
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("count", rs.getInt("remain_count"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getItemsOfCategory) : " + e.getMessage());
        }
        return items;
    }

    public JSONArray getItemsOfDept(String dname) {
        JSONArray items = new JSONArray();
        String query = "SELECT d.dname, i.iname, i.remain_count " +
                "FROM DEPARTMENT d, CATEGORY c, ITEM i " +
                "where c.cid = i.category_cid and i.did = d.did and d.dname = '"+dname+"' ";
        try {
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                JSONObject eachItem= new JSONObject();
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("count", rs.getInt("remain_count"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getItemsOfCategory) : " + e.getMessage());
        }
        return items;
    }

//    public JSONArray getMy
//    public int addItem(String iname, String cid, int count, int item_adder){
//        String query = "SELECT * " +
//                "FROM users " +
//                "WHERE uuid=" + item_adder;
//        JSONArray _adder = executeQuery(query);
//        JSONObject adder =  (JSONObject) _adder.get(0);
//        if(true == adder.get("admin")){
//            try{
//                CallableStatement cs = conn.prepareCall("{call update_item(?,?,?,?)}");
//                cs.setString(1,iname);
//                cs.setInt(2,count)
//
//            } catch (SQLException e){
//                System.err.println("! SQL ERROR (cannot call procedure) : " + e.getMessage());
//            }
//            return count;
//        } else{
//            return 0;
//        }
//        return executeSQL(sql);
//    }
}
