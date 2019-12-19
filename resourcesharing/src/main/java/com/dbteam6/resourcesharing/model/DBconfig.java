package com.dbteam6.resourcesharing.model;

public class DBconfig {
    private final static String hostIp = "jdbc:oracle:thin:@52.78.20.15:1521:XE";
    private final static String user = "kdhong";
    private final static String pw = "kdhong";

    public static String getHostIp() {
        return hostIp;
    }

    public static String getUser() {
        return user;
    }

    public static String getPw() {
        return pw;
    }
}
