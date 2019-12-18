package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.dto.DepartmentDto;
import net.minidev.json.JSONArray;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DeptDao extends Dao {
    private static DeptDao instance = null;

    private DeptDao() {
        super();
        System.out.println("DeptDao's JDBC driver is found");
    }

    public static DeptDao getInstance() {
        if (instance == null) {
            instance = new DeptDao ();
        }
        return instance;
    }

    private JSONArray executeQuery(String query) {
        JSONArray jsonResults = new JSONArray();
        try {
            holdConnection();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                DepartmentDto dept = new DepartmentDto(rs.getInt("did"), rs.getString("dname"));
                jsonResults.add(dept.toJSONObject());
            }
            releaseConnection();
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (" + query + ") : " + e.getMessage());
        }
        return jsonResults;
    }


    public JSONArray findAll() {
        String query = "SELECT * FROM department";
        return executeQuery(query);
    }

    public JSONArray findByCondition(String condition) {
        String query = "SELECT * FROM users WHERE " + condition;
        return executeQuery(query);
    }

    public JSONArray getDeptOfCategories(String category_name){
        String query = "SELECT d.did, d.dname " +
                "FROM DEPARTMENT d, CATEGORY c, ITEM i " +
                "WHERE c.cid = i.category_cid and i.did = d.did and c.cname='"+ category_name + "' " +
                "GROUP BY d.dname;";
        return executeQuery(query);
    }

}
