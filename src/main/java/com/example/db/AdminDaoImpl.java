package com.example.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDaoImpl implements AdminDao {
    @Override
    public boolean updateStudent(String opt, String username, String text) {
        String str;
        if (opt.equals("1")) str = "jy_region";
        else if (opt.equals("2")) str = "jy_age";
        else str = "jy_credits";
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE jiangy_student SET " + str + "=? WHERE jy_id=?");
            stat.setString(1, text);
            stat.setString(2, username);
            int rows = stat.executeUpdate();
            if (rows == 0) return false;
            Dao.closeAll(conn, stat, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean updateTeacher(String opt, String username, String text) {
        String str;
        if (opt.equals("1")) str = "jy_title";
        else if (opt.equals("2")) str = "jy_age";
        else str = "jy_phone";
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE jiangy_teacher SET " + str + "=? WHERE jy_id=?");
            stat.setString(1, text);
            stat.setString(2, username);
            int rows = stat.executeUpdate();
            if (rows == 0) return false;
            Dao.closeAll(conn, stat, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean updateCourse(String opt, String username, String text) {
        String str;
        if (opt.equals("1")) str = "jy_term";
        else str = "jy_detail";
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE jiangy_course SET " + str + "=? WHERE jy_id=?");
            stat.setString(1, text);
            stat.setString(2, username);
            int rows = stat.executeUpdate();
            if (rows == 0) return false;
            Dao.closeAll(conn, stat, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean resetPwd(String role, String username) {
        String str;
        if (role.equals("1")) str = "jiangy_studentpwd";
        else str = "jiangy_teacherpwd";
        try {
            Connection conn = getConnection();
            username = new String(username.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE " + str + " SET jy_password=\'123456\' WHERE jy_username=?");
            stat.setString(1, username);
            int rows = stat.executeUpdate();
            if (rows == 0) return false;
            Dao.closeAll(conn, stat, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean registerNew(String role, Record record) {
        if (role.equals("1")) {
            String sql = "INSERT INTO jiangy_teacher VALUES(?,?,?,?,?,?);";
            try {
                Connection conn = getConnection();
                PreparedStatement stat = conn.prepareStatement(sql);
                stat.setString(1, record.getTeacherId());
                stat.setString(2, new String(record.getTeacherName().getBytes("iso-8859-1"), "UTF-8"));
                stat.setBoolean(3, record.getTeacherSex().equals("1"));
                stat.setString(4, record.getTeacherAge());
                stat.setString(5, new String(record.getTeacherTitle().getBytes("iso-8859-1"), "UTF-8"));
                stat.setString(6, record.getTeacherPhone());
                int rows = stat.executeUpdate();
                Dao.closeAll(conn, stat, null);
                if (rows != 0) return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (role.equals("2")) {
            String sql = "INSERT INTO jiangy_student VALUES(?,?,?,?,?,?,?,?,?);";
            try {
                Connection conn = getConnection();
                PreparedStatement stat = conn.prepareStatement(sql);
                stat.setString(1, record.getStudentId());
                stat.setString(2, new String(record.getMajorId().getBytes("iso-8859-1"), "UTF-8"));
                stat.setString(3, record.getGrade());
                stat.setString(4, new String(record.getClassName().getBytes("iso-8859-1"), "UTF-8"));
                stat.setString(5, new String(record.getStudentName().getBytes("iso-8859-1"), "UTF-8"));
                stat.setBoolean(6, record.getStudentSex().equals("1"));
                stat.setString(7, record.getStudentAge());
                stat.setString(8, new String(record.getStudentRegion().getBytes("iso-8859-1"), "UTF-8"));
                stat.setString(9, record.getStudentCredits());
                int rows = stat.executeUpdate();
                Dao.closeAll(conn, stat, null);
                if (rows != 0) return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else return false;
        return false;
    }

    @Override
    public ArrayList<Record> queryRegion(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_region=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_regionview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentRegion(rs.getString("jy_region"));
                record.setCount(rs.getString("jy_count"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryStudent(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_id=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_name=?;";
        } else if (opt.equals("3")) {
            str = " WHERE jy_grade=?;";
        } else if (opt.equals("4")) {
            str = " WHERE jy_major=?;";
        } else if (opt.equals("5")) {
            str = " WHERE jy_class_name=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_studentview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("6")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentId(rs.getString("jy_id"));
                record.setStudentName(rs.getString("jy_name"));
                record.setStudentAge(rs.getString("jy_age"));
                record.setStudentSex(rs.getString("jy_sex"));
                record.setStudentRegion(rs.getString("jy_region"));
                record.setMajorName(rs.getString("jy_major"));
                record.setClassName(rs.getString("jy_class_name"));
                record.setStudentCredits(rs.getString("jy_credits"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryTeacher(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_id=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_name=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_teacherview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("3")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setTeacherId(rs.getString("jy_id"));
                record.setTeacherName(rs.getString("jy_name"));
                record.setTeacherSex(rs.getString("jy_sex"));
                record.setTeacherAge(rs.getString("jy_age"));
                record.setTeacherTitle(rs.getString("jy_title"));
                record.setTeacherPhone(rs.getString("jy_phone"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryClass(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_major=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_grade=?;";
        } else if (opt.equals("3")) {
            str = " WHERE jy_class=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_classview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("4")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setMajorName(rs.getString("jy_major"));
                record.setGrade(rs.getString("jy_grade"));
                record.setClassName(rs.getString("jy_class"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryMajor(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_major=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_majorview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setMajorId(rs.getString("jy_id"));
                record.setMajorName(rs.getString("jy_major"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryCourse(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_course_number=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_name=?;";
        } else if (opt.equals("3")) {
            str = " WHERE jy_teacher=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_courseview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("4")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setCourseName(rs.getString("jy_name"));
                record.setCourseCredit(rs.getString("jy_credit"));
                record.setCoursePeriod(rs.getString("jy_period"));
                record.setCourseExamination(rs.getString("jy_examination"));
                record.setCourseNumber(rs.getString("jy_course_number"));
                record.setCourseId(rs.getString("jy_id"));
                record.setClassName(rs.getString("jy_class_name"));
                record.setCourseTerm(rs.getString("jy_term"));
                record.setTeacherName(rs.getString("jy_teacher"));
                record.setCourseDetail(rs.getString("jy_detail"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }
}
