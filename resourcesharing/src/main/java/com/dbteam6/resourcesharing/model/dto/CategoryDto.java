package com.dbteam6.resourcesharing.model.dto;

import net.minidev.json.JSONObject;

public class CategoryDto {
    private int cid;
    private String cname;

    public CategoryDto(int _cid, String _cname){
        this.cid = _cid;
        this.cname = _cname;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
    public JSONObject toJSONObject(){
        JSONObject jObj = new JSONObject();
        jObj.put("cid", this.cid);
        jObj.put("cname", this.cname);
        return jObj;
    }
}
