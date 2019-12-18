package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.dto.BorrowDto;
import net.minidev.json.JSONArray;

import java.sql.SQLException;

public class BorrowDao extends Dao {
    private static BorrowDao instance = null;

    private BorrowDao(){
        super();
        System.out.println("BorrowDao's JDBC driver is found");
    }

    public static BorrowDao getInstance() {
        if (instance == null) {
            instance = new BorrowDao();
        }
        return instance;
    }

    private JSONArray executeQuery(String query) {
        JSONArray jsonResults = new JSONArray();
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                BorrowDto borrow = new BorrowDto(rs.getInt("borrow_uuid"), rs.getInt("borrow_iid"), rs.getInt("count"), rs.getString("start_date"), rs.getString("end_date"));
                jsonResults.add(borrow.toJSONObject());
            }
            releaseConnection();
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (" + query + ") : " + e.getMessage());
        }
        return jsonResults;
    }

    public JSONArray findAll() {
        String query = "SELECT * FROM borrow";
        return executeQuery(query);
    }
    public JSONArray findByCondition(String condition){
        String query = "SELECT * FROM borrow WHERE " + condition;
        return executeQuery(query);
    }
}