package com.dbteam6.resourcesharing.model.dto;

public class DepartmentDto {
    private int did;
    private String dname;

    public DepartmentDto(int _did){
        this.did = _did;
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
}
