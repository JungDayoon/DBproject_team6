package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.DBconfig;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

import java.sql.*;
/*Because this project is part of a DB class, We don't use ORM(ex.JPA) or SQL Mapper(ex.mybatis) or Spring JDBC. We use only Oracle JDBC driver to implement DAO*/
/*We don't need Dto. Because we will treat the object in JSON format*/
public class Dao {
    private String hostId;
    private String user;
    private String pw;
    private Connection connection;
    private String sql;
    private String query;


    public Dao() {
        /* DB configuration */
        this.hostId = DBconfig.getHostIp();
        this.user = DBconfig.getUser();
        this.pw = DBconfig.getPw();

        /* Search JDBC driver*/
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("UserDao's JDBC driver is found");
        } catch (ClassNotFoundException e) {
            System.err.println("Driver Search error!!! : " + e.getMessage());
            System.exit(1);
        }

        /* Connection to DB server */
        try {
            this.connection = DriverManager.getConnection(this.hostId, this.user, this.pw);
        } catch (SQLException e) {
            System.err.println("Driver connection error!!! :" + e.getMessage());
        }
    }

    protected static JSONArray ResultSetToJSONArray(ResultSet resultSet) {
        JSONArray jArray = new JSONArray();

        try {
            while (resultSet.next()) {
                JSONObject jObject = new JSONObject();
                ResultSetMetaData resultMeta = resultSet.getMetaData();

                for (int i = 1; i <= resultMeta.getColumnCount(); i++) {
                    jObject.put(resultMeta.getColumnName(i), resultSet.getString(resultMeta.getColumnClassName(i)));
                }

                jArray.add(jObject);
            }
        } catch (SQLException e) {
            System.out.println("! SQL ERROR : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("! ERROR : " + e.getMessage());
        }
        return jArray;
    }


    protected JSONArray findAll(String tableName) {
        try {
            this.connection.setAutoCommit(false);
            Statement statement = connection.createStatement();
            query = "SELCT * FROM " + tableName;
            ResultSet resultSet = statement.executeQuery(query);
            return Dao.ResultSetToJSONArray(resultSet);
        } catch (SQLException e) {
            System.out.println("! SQL ERROR : " + e.getMessage());
            return null;
        }
    }

    protected JSONArray findAllByCondition(String tableName, String condition) {
        try {
            this.connection.setAutoCommit(false);
            Statement statement = connection.createStatement();
            query = "SELCT * FROM " + tableName + "WHERE" + condition;
            ResultSet resultSet = statement.executeQuery(query);
            return Dao.ResultSetToJSONArray(resultSet);
        } catch (SQLException e) {
            System.out.println("! SQL ERROR : " + e.getMessage());
            return null;
        }
    }
}
