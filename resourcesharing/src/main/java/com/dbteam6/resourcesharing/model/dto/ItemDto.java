package com.dbteam6.resourcesharing.model.dto;

import net.minidev.json.JSONObject;

public class ItemDto {
    private int iid;
    private String iname;
    private int category_cid;
    private int remain_count;
    private int did;

    public ItemDto(int _iid, String _iname, int _cid, int _count, int _did) {
        this.iid = _iid;
        this.iname = _iname;
        this.category_cid = _cid;
        this.remain_count = _count;
        this.did = _did;
    }

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public int getCategory_cid() {
        return category_cid;
    }

    public void setCategory_cid(int category_cid) {
        this.category_cid = category_cid;
    }

    public int getRemain_count() {
        return remain_count;
    }

    public void setRemain_count(int remain_count) {
        this.remain_count = remain_count;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public JSONObject toJSONObject(){
        JSONObject jObj = new JSONObject();
        jObj.put("iid", this.iid);
        jObj.put("iname", this.iname);
        jObj.put("category_cid", this.category_cid);
        jObj.put("remain_count", this.remain_count);
        jObj.put("did", this.did);
        return jObj;
    }
}
