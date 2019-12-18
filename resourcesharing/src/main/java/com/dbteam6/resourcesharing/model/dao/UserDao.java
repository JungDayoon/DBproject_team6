package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.dto.UserDto;
import net.minidev.json.JSONArray;
import java.sql.*;

public class UserDao extends Dao {
    private static UserDao instance = null;

    private UserDao() {
        super();
        System.out.println("UserDao's JDBC driver is found");
    }

    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    private JSONArray executeQuery(String query) {
        JSONArray jsonResults = new JSONArray();
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                UserDto user = new UserDto(rs.getInt("uuid"), rs.getString("uname"), rs.getString("pwd"), rs.getBoolean("admin"), rs.getInt("did"));
                user.setDname(rs.getString("dname"));
                jsonResults.add(user.toJSONObject());
            }
            releaseConnection();
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (" + query + ") : " + e.getMessage());
        }
        return jsonResults;
    }

    public JSONArray findAll() {
        String query = "SELECT u.uuid, u.uname, u.pwd, u.admin, u.did, d.dname " +
                "FROM users u, department d " +
                "WHERE u.did = d.did";
        return executeQuery(query);
    }

    public JSONArray findByCondition(String condition) {
        String query = "SELECT u.uuid, u.uname, u.pwd, u.admin, u.did, d.dname " +
                "FROM users u, department d " +
                "WHERE u.did = d.did and " + condition;
        return executeQuery(query);
    }

    public JSONArray getUserInfoById(int uuid){
        String query = "SELECT u.uuid, u.uname, u.pwd, u.admin, u.did, d.dname " +
                "FROM users u, department d " +
                "WHERE u.did = d.did and u.uuid="+uuid;
        return executeQuery(query);
    }
    public int addUser(int uuid, String uname, String pwd, String major) {
        String sql = "INSERT INTO users(uuid,uname,pwd,admin,did) "
                + "VALUES("
                + uuid + ",'"
                + uname + "','"
                + pwd + "',"
                + "0 ,"
                + "(SELECT did FROM department WHERE dname='" + major +"')"
                + ")";
        return executeSQL(sql);
    }

    public int updateUser(String condition, String field, String value) {
        String sql = "UPDATE users SET " + field + "=" + value + " WHERE " + condition;
        return executeSQL(sql);
    }


    public int deleteUser(String condition) {
        String sql = "DELETE FROM users WHERE " + condition;
        return executeSQL(sql);
    }
}
