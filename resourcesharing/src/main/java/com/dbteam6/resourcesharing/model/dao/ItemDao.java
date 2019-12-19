package com.dbteam6.resourcesharing.model.dao;

import com.dbteam6.resourcesharing.model.dto.ItemDto;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

import java.sql.CallableStatement;
import java.sql.SQLException;

public class ItemDao extends Dao {
    private static ItemDao instance = null;

    private ItemDao() {
        super();
        System.out.println("ItemDao's JDBC driver is found");
    }

    public static ItemDao getInstance() {
        if (instance == null) {
            instance = new ItemDao();
        }
        return instance;
    }

    private JSONArray executeQuery(String query) throws SQLException {
        JSONArray jsonResults = new JSONArray();
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                ItemDto item = new ItemDto(rs.getInt("iid"), rs.getString("iname"), rs.getInt("category_cid"),
                        rs.getInt("remain_count"), rs.getInt("did"));
                jsonResults.add(item.toJSONObject());
            }
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (" + query + ") : " + e.getMessage());
        } finally {
            releaseConnection();
        }
        return jsonResults;
    }

    public JSONArray findAll() {
        String query = "SELECT * FROM item";
        try {
            return executeQuery(query);
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (executeQuery): " + e.getMessage());
            return null;
        }
    }

    public JSONArray findByCondition(String condition) {
        String query = "SELECT * FROM item WHERE " + condition;
        try {
            return executeQuery(query);
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (executeQuery): " + e.getMessage());
            return null;
        }
    }

    public JSONArray getOnesItems(int uuid) throws SQLException {
        JSONArray items = new JSONArray();
        String query = "SELECT i.iid, i.iname, d.dname ,b.count, b.start_date, b.end_date "
                + "FROM borrow b, item i, department d " + "WHERE b.borrow_uuid = " + uuid
                + " and b.borrow_iid = i.iid and d.did = i.did";
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                JSONObject eachItem = new JSONObject();
                eachItem.put("iid", rs.getInt("iid"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("count", rs.getInt("count"));
                eachItem.put("start_date", rs.getString("start_date"));
                eachItem.put("end_date", rs.getString("end_date"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getOnesItem fail) :" + e.getMessage());
        } finally {
            releaseConnection();
        }

        return items;
    }

    public boolean borrowItem(int uuid, int iid, int count) throws SQLException {
        try {
            holdConnection();
            cstmt = conn.prepareCall("{call add_borrow(?,?,?)}");
            cstmt.setInt(1, uuid);
            cstmt.setInt(2, iid);
            cstmt.setInt(3, count);
            Boolean flag = cstmt.execute();
            cstmt.close();
            releaseConnection();
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (Borrow item procedure) :" + e.getMessage());
            cstmt.close();
            releaseConnection();
            return false;
        }
        return true;
    }

    public JSONArray getItemsOfCategory(String cname) throws SQLException {
        JSONArray items = new JSONArray();
        String query = "SELECT i.iid, d.dname, c.cname, i.iname, i.remain_count " + "FROM DEPARTMENT d, CATEGORY c, ITEM i "
                + "WHERE c.cid = i.category_cid and i.did = d.did and c.cname='" + cname + "'";
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                JSONObject eachItem = new JSONObject();
                eachItem.put("iid", rs.getInt("iid"));
                eachItem.put("cname", rs.getString("cname"));
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("count", rs.getInt("remain_count"));
                items.add(eachItem);
            }

        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getItemsOfCategory) : " + e.getMessage());
        } finally {
            releaseConnection();
        }
        return items;
    }

    public JSONArray getAllItems() throws SQLException {
        JSONArray items = new JSONArray();
        String query = "SELECT d.dname, i.iid, i.iname, i.remain_count, c.cname " + "FROM DEPARTMENT d, ITEM i, CATEGORY c "
                + "WHERE i.did = d.did and i.category_cid = c.cid";
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                JSONObject eachItem = new JSONObject();
                eachItem.put("iid", rs.getString("iid"));
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("cname", rs.getString("cname"));
                eachItem.put("count", rs.getInt("remain_count"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getItemsOfCategory) : " + e.getMessage());
        } finally {
            releaseConnection();
        }
        return items;
    }

    public JSONArray getItemsOfDept(String dname) throws SQLException {
        JSONArray items = new JSONArray();
        String query = "SELECT i.iid, c.cname, d.dname, i.iname, i.remain_count " + "FROM DEPARTMENT d, CATEGORY c, ITEM i "
                + "where c.cid = i.category_cid and i.did = d.did and d.dname = '" + dname + "' ";
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                JSONObject eachItem = new JSONObject();
                eachItem.put("iid", rs.getInt("iid"));
                eachItem.put("cname", rs.getString("cname"));
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("count", rs.getInt("remain_count"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getItemsOfCategory) : " + e.getMessage());
        } finally {
            releaseConnection();
        }
        return items;
    }

    public JSONArray getOnesItemById(int uuid, int iid) throws SQLException {
        JSONArray items = new JSONArray();
        String query = "SELECT i.iid, i.iname, d.dname ,b.count, b.start_date, b.end_date "
                + "FROM borrow b, item i, department d " + "WHERE b.borrow_uuid = " + uuid
                + " and b.borrow_iid = " + iid + " and d.did = i.did";
        try {
            holdConnection();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                JSONObject eachItem = new JSONObject();
                eachItem.put("iid", rs.getInt("iid"));
                eachItem.put("iname", rs.getString("iname"));
                eachItem.put("dname", rs.getString("dname"));
                eachItem.put("count", rs.getInt("count"));
                eachItem.put("start_date", rs.getString("start_date"));
                eachItem.put("end_date", rs.getString("end_date"));
                items.add(eachItem);
            }
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (getOnesItem fail) :" + e.getMessage());
        } finally {
            releaseConnection();
        }
        return items;
    }

    public boolean returnItem(int uuid, int iid) throws SQLException {
        try {
            holdConnection();
            String sql = "DELETE FROM borrow " +
                    "WHERE borrow_iid=" + iid +" " +
                    "and borrow_uuid=" + uuid;
            executeSQL(sql);
            return true;
        } catch (SQLException e) {
            System.err.println("! SQL ERROR (return item) : " + e.getMessage());
            return false;
        }
    }

    public boolean updateItem(int iid, int newCount) throws SQLException {
        try {
            holdConnection();
            cstmt = conn.prepareCall("{call update_item(?,?)}");
            cstmt.setInt(1, iid);
            cstmt.setInt(2, newCount);
            Boolean flag = cstmt.execute();
            cstmt.close();
            releaseConnection();
            return true;
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (Add item procedure) :" + e.getMessage());
            cstmt.close();
            releaseConnection();
            return false;
        }
    }
    public boolean addItem(String iname, String dname, String cname, int count) throws SQLException {
        try {
            holdConnection();
            cstmt = conn.prepareCall("{call add_item(?,?,?,?)}");
            cstmt.setString(1, iname);
            cstmt.setInt(2, count);
            cstmt.setString(3, dname);
            cstmt.setString(4, cname);
            Boolean flag = cstmt.execute();
            cstmt.close();
            releaseConnection();
            return true;
        } catch (SQLException e) {
            System.out.println("! SQL ERROR (Add item procedure) :" + e.getMessage());
            cstmt.close();
            releaseConnection();
            return false;
        }
    }
    // return count;
    // } else{
    // return 0;
    // }
    // return executeSQL(sql);
    // }
}
