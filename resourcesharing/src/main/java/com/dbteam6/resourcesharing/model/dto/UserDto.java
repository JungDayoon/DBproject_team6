package com.dbteam6.resourcesharing.model.dto;

import net.minidev.json.JSONObject;

public class UserDto {
    private int uuid;
    private String uname;
    private String pwd;
    private boolean admin;
    private int did;
    private String dname;

    public UserDto(int _uuid, String _uname, String _pwd, boolean _admin, int _did) {
        this.uuid = _uuid;
        this.uname = _uname;
        this.pwd = _pwd;
        this.admin = _admin;
        this.did = _did;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDname() {
        return dname;
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

    public boolean getAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public JSONObject toJSONObject() {
        JSONObject jObj = new JSONObject();
        jObj.put("uuid", this.uuid);
        jObj.put("uname", this.uname);
        jObj.put("pwd", this.pwd);
        jObj.put("admin", this.admin);
        jObj.put("did", this.did);
        if (dname.length() != 0) {
            jObj.put("dname", this.dname);
        }
        return jObj;
    }
}
