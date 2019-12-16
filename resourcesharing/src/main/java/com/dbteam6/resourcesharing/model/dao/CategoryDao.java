package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.dto.CategoryDto;
import net.minidev.json.JSONArray;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryDao extends Dao {
    private static CategoryDao instance = null;

    private CategoryDao(){
        super();
        System.out.println("CategoryDao's JDBC driver is found");
    }

    public static CategoryDao getInstance() {
        if (instance == null) {
            instance = new CategoryDao();
        }
        return instance;
    }

    private JSONArray executeQuery(String query) {
        JSONArray jsonResults = new JSONArray();
        try {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                CategoryDto Category = new CategoryDto(rs.getInt("cid"), rs.getString("cname"));
                jsonResults.add(Category.toJSONObject());
            }
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (" + query + ") : " + e.getMessage());
        }
        return jsonResults;
    }

    public JSONArray findAll() {
        String query = "SELECT * FROM category";
        return executeQuery(query);
    }
    public JSONArray findByCondition(String condition){
        String query = "SELECT * FROM category WHERE " + condition;
        return executeQuery(query);
    }
}