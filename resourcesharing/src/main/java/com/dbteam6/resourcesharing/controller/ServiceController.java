package com.dbteam6.resourcesharing.controller;

import com.dbteam6.resourcesharing.model.dao.ItemDao;
import com.dbteam6.resourcesharing.model.dao.UserDao;
import net.minidev.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;

@Controller
public class ServiceController {
    ItemDao iDao = ItemDao.getInstance();
    /* Sign in */
    @ResponseBody
    @PostMapping("/services/login/{id}/{pw}")
    public boolean validLogin(@PathVariable("id") int id, @PathVariable("pw") String pw) throws SQLException {
        System.out.println("@ REQUEST : [id]" + id + "try to login by [pw] " + pw);
        String condition = "uuid=" + id + " and pwd=FUNC_MD5_ENCRYPTION('" + pw + "')";
        JSONArray result = UserDao.getInstance().findByCondition(condition);
        if (result.size() == 1) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/services/checkdup/{id}")
    public boolean checkDup(@PathVariable("id") int id) throws SQLException {
        String condition = "uuid=" + id;
        JSONArray result = UserDao.getInstance().findByCondition(condition);
        return result.size() != 0;
    }

    @ResponseBody
    @PostMapping("services/{uuid}/borrow/{iid}/{count}")
    public boolean borrowItem (@PathVariable("uuid") int uuid, @PathVariable("iid") int iid, @PathVariable("count") int count) throws SQLException {
        System.out.println("@ POST [uid]"+uuid+" burrow + [iid]" + iid +"[count]"+ count);
        return iDao.borrowItem(uuid,iid,count);
    }
}
