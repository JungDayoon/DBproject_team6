package com.dbteam6.resourcesharing.model.dto;

public class UserDto {
    private int uuid;
    private String uname;
    private String pwd;
    private int admin;
    private int did;

    public UserDto(int _uuid){
        this.uuid = _uuid;
    }

    public int getUuid() {
        return uuid;
    }

    public void setUuid(int uuid) {
        this.uuid = uuid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }
}
