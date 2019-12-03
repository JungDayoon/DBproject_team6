package com.dbteam6.resourcesharing.model.dao;
import net.minidev.json.JSONArray;


public class UserDao extends Dao{
    private String tableName="user";

    public UserDao(){
        super();
    }
    public JSONArray findAll(){
        return super.findAll(this.tableName);
    }
    public JSONArray findAllByCondition(String condition){
        return super.findAllByCondition(tableName, condition);
    }
}
