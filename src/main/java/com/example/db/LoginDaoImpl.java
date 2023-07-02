package com.example.db;

import java.sql.*;
import java.util.ArrayList;

public class LoginDaoImpl implements LoginDao {
    public int queryPwd(String username, String password, String role) {
        int ans = 0;
        try {
            Connection conn = getConnection();
            CallableStatement stat = role.equals("1") ? conn.prepareCall("{?=call queryadminpwd(?,?)}") : (role.equals("2") ? conn.prepareCall("{?=call queryteacherpwd(?,?)}") : conn.prepareCall("{?=call querystudentpwd(?,?)}"));
            stat.registerOutParameter(1, Types.INTEGER);
            stat.setString(2, username);
            stat.setString(3, password);
            stat.execute();
            ans = stat.getInt(1);
            Dao.closeAll(conn, stat, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }

    public ArrayList<String> queryPwd(String username, String role) {
        ArrayList<String> res = new ArrayList<>();
        String str;
        if (role.equals("1")) str = "jiangy_adminpwd";
        else if (role.equals("2")) str = "jiangy_teacherpwd";
        else str = "jiangy_studentpwd";
        try {
            Connection conn = getConnection();
            PreparedStatement stat = conn.prepareStatement("SELECT jy_password FROM " + str + " WHERE jy_username=?");
            stat.setString(1, username);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                res.add(rs.getString("jy_password"));
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public boolean updatePwd(String username, String oldpwd, String newpwd, String role) {
        ArrayList<String> res = queryPwd(username, role);
        if (!res.get(0).equals(oldpwd)) {
            return false;
        }
        String str;
        if (role.equals("1")) str = "jiangy_adminpwd";
        else if (role.equals("2")) str = "jiangy_teacherpwd";
        else str = "jiangy_studentpwd";
        try {
            Connection conn = getConnection();
            PreparedStatement stat = conn.prepareStatement("UPDATE " + str + " SET jy_password=? WHERE jy_password=? AND jy_username=?");
            stat.setString(1, newpwd);
            stat.setString(2, oldpwd);
            stat.setString(3, username);
            stat.executeUpdate();
            Dao.closeAll(conn, stat, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
