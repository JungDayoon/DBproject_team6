package com.dbteam6.resourcesharing.model.dto;

import net.minidev.json.JSONObject;

public class DepartmentDto {
    private int did;
    private String dname;

    public DepartmentDto(int _did, String _dname){
        this.did = _did;
        this.dname = _dname;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public JSONObject toJSONObject(){
        JSONObject jObj = new JSONObject();
        jObj.put("did", this.did);
        jObj.put("dname", this.dname);
        return jObj;
    }
}
