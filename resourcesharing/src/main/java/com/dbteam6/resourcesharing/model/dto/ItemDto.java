package com.dbteam6.resourcesharing.model.dto;

public class ItemDto {
    private int iid;
    private String iname;
    private int category_cid;
    private int remain_count;
    private int did;

    public ItemDto(int _iid){
        this.iid = _iid;
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
}
