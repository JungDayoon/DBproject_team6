package com.dbteam6.resourcesharing.model.dto;

public class BorrowDto {
    private int burrow_uuid;
    private int burrow_iid;
    private int count;
    private String start_date;
    private String end_date;

    public BorrowDto(int _burrow_uuid, int _burrow_iid){
        this.burrow_uuid = _burrow_uuid;
        this.burrow_iid = _burrow_iid;
    }

    public int getBurrow_uuid() {
        return burrow_uuid;
    }

    public int getBurrow_iid() {
        return burrow_iid;
    }

    public void setBurrow_id(int burrow_uuid, int burrow_iid) {
        this.burrow_uuid = burrow_uuid;
        this.burrow_iid = burrow_iid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }
}
