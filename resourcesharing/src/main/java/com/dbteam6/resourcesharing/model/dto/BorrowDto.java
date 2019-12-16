package com.dbteam6.resourcesharing.model.dto;

import net.minidev.json.JSONObject;

public class BorrowDto {
    private int borrow_uuid;
    private int borrow_iid;
    private int count;
    private String start_date;
    private String end_date;


    public BorrowDto(int borrow_uuid, int borrow_iid, int count, String start_date, String end_date) {
        this.borrow_uuid = borrow_uuid;
        this.borrow_iid = borrow_iid;
        this.count = count;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public int getBurrow_uuid() {
        return borrow_uuid;
    }

    public int getBurrow_iid() {
        return borrow_iid;
    }

    public void setBurrow_id(int borrow_uuid, int borrow_iid) {
        this.borrow_uuid = borrow_uuid;
        this.borrow_iid = borrow_iid;
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
    public JSONObject toJSONObject(){
        JSONObject jObj = new JSONObject();
        jObj.put("borrow_uuid", this.borrow_uuid);
        jObj.put("borrow_iid", this.borrow_iid);
        jObj.put("count", this.count);
        jObj.put("start_date", this.start_date);
        jObj.put("end_date", this.end_date);
        return jObj;
    }
}
