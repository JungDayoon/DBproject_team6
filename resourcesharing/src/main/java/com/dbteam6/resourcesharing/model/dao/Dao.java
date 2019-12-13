package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.DBconfig;

import java.sql.*;

public class Dao {
    protected Connection conn;
    protected Statement stmt;

    public Dao() {
        /* DB configuration */
        if (conn == null) {
            try {
                /* Search JDBC driver*/
                Class.forName("oracle.jdbc.driver.OracleDriver");
                /* Connection to DB server */
                this.conn = DriverManager.getConnection(DBconfig.getHostIp(), DBconfig.getUser(), DBconfig.getPw());
                this.stmt = conn.createStatement();
            } catch (ClassNotFoundException e) {
                System.err.println("Driver Search error!!! : " + e.getMessage());
                System.exit(1);
            } catch (SQLException e) {
                System.err.println("Driver connection error!!! :" + e.getMessage());
            }
        }
    }

    protected int executeSQL(String sql) {
        int result = 0;
        try {
            conn.setAutoCommit(false);
            System.out.println(sql);//test
            result = stmt.executeUpdate(sql);
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (" + sql + ") : " + e.getMessage());
        }
        return result;
    }
}
