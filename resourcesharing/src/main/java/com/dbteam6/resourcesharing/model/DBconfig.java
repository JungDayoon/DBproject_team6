package com.dbteam6.resourcesharing.model;

public class DBconfig {
    private final static String hostIp = "jdbc:oracle:thin:@localhost:1521:oraknu";
    private final static String user = "rShare";
    private final static String pw = "rShare";

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
