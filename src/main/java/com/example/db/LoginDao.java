package com.example.db;

import java.util.ArrayList;

public interface LoginDao extends Dao {
    public ArrayList<String> queryPwd(String username, String role);

    public int queryPwd(String username, String password, String role);

    public boolean updatePwd(String username, String oldpwd, String newpwd, String role);
}
