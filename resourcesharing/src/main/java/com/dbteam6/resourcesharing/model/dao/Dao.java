package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.DBconfig;

import java.sql.*;

public class Dao {
    protected Connection conn;
    protected Statement stmt;
    protected ResultSet rs;

    public Dao() {
        /* DB configuration */
        if (conn == null) {
            try {
                /* Search JDBC driver*/
                Class.forName("oracle.jdbc.driver.OracleDriver");
                /* Connection to DB server */
            } catch (ClassNotFoundException e) {
                System.err.println("Driver Search error!!! : " + e.getMessage());
                System.exit(1);
            }
        }
    }

    protected void holdConnection() throws SQLException {
        this.conn = DriverManager.getConnection(DBconfig.getHostIp(), DBconfig.getUser(), DBconfig.getPw());
        this.stmt = conn.createStatement();
        this.conn.setAutoCommit(false);
    }

    protected void releaseConnection() throws SQLException {
        if (this.rs != null) {
            this.rs.close();
        }
        if (this.stmt != null) {
            this.stmt.close();
        }
        if (this.conn != null) {
            this.conn.setAutoCommit(true);
            this.conn.commit();
            this.conn.close();
        }
    }

    protected int executeSQL(String sql) {
        int result = 0;
        try {
            holdConnection();
            System.out.println(sql);//test
            result = stmt.executeUpdate(sql);
            releaseConnection();
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (" + sql + ") : " + e.getMessage());
        }
        return result;
    }
}
