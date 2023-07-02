package com.example.db;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;

public interface Dao {

    public static DataSource getDataSource() {
        DataSource dataSource = null;
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/JiangyMIS10");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataSource;
    }

    public default Connection getConnection() throws Exception {
        DataSource dataSource = getDataSource();
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void closeAll(Connection conn, Statement stmt, ResultSet rs) throws Exception {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
}