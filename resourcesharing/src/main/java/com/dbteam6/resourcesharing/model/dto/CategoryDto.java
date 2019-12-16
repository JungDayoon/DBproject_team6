package com.dbteam6.resourcesharing.model.dto;

public class CategoryDto {
    private int cid;
    private String cname;

    public CategoryDto(int _cid){
        this.cid = _cid;
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
}
