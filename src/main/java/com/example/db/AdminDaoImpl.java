package com.example.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDaoImpl implements AdminDao {
    @Override
    public boolean updateStudent(String opt, String username, String text) {
        String str;
        if (opt.equals("1")) str = "jy_region10";
        else if (opt.equals("2")) str = "jy_age10";
        else str = "jy_credits10";
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE jiangy_student10 SET " + str + "=? WHERE jy_id10=?");
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
        if (opt.equals("1")) str = "jy_title10";
        else if (opt.equals("2")) str = "jy_age10";
        else str = "jy_phone10";
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE jiangy_teacher10 SET " + str + "=? WHERE jy_id10=?");
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
        if (opt.equals("1")) str = "jy_term10";
        else str = "jy_detail10";
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE jiangy_course10 SET " + str + "=? WHERE jy_id10=?");
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
        if (role.equals("1")) str = "jiangy_studentpwd10";
        else str = "jiangy_teacherpwd10";
        try {
            Connection conn = getConnection();
            username = new String(username.getBytes("iso-8859-1"), "UTF-8");
            PreparedStatement stat = conn.prepareStatement("UPDATE " + str + " SET jy_password10=\'123456\' WHERE jy_username10=?");
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
            String sql = "INSERT INTO jiangy_teacher10 VALUES(?,?,?,?,?,?);";
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
            String sql = "INSERT INTO jiangy_student10 VALUES(?,?,?,?,?,?,?,?,?);";
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
            str = " WHERE jy_region10=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_regionview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentRegion(rs.getString("jy_region10"));
                record.setCount(rs.getString("jy_count10"));
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
            str = " WHERE jy_id10=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_name10=?;";
        } else if (opt.equals("3")) {
            str = " WHERE jy_grade10=?;";
        } else if (opt.equals("4")) {
            str = " WHERE jy_major10=?;";
        } else if (opt.equals("5")) {
            str = " WHERE jy_class_name10=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_studentview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("6")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentId(rs.getString("jy_id10"));
                record.setStudentName(rs.getString("jy_name10"));
                record.setStudentAge(rs.getString("jy_age10"));
                record.setStudentSex(rs.getString("jy_sex10"));
                record.setStudentRegion(rs.getString("jy_region10"));
                record.setMajorName(rs.getString("jy_major10"));
                record.setClassName(rs.getString("jy_class_name10"));
                record.setStudentCredits(rs.getString("jy_credits10"));
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
            str = " WHERE jy_id10=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_name10=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_teacherview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("3")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setTeacherId(rs.getString("jy_id10"));
                record.setTeacherName(rs.getString("jy_name10"));
                record.setTeacherSex(rs.getString("jy_sex10"));
                record.setTeacherAge(rs.getString("jy_age10"));
                record.setTeacherTitle(rs.getString("jy_title10"));
                record.setTeacherPhone(rs.getString("jy_phone10"));
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
            str = " WHERE jy_major10=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_grade10=?;";
        } else if (opt.equals("3")) {
            str = " WHERE jy_class10=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_classview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("4")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setMajorName(rs.getString("jy_major10"));
                record.setGrade(rs.getString("jy_grade10"));
                record.setClassName(rs.getString("jy_class10"));
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
            str = " WHERE jy_major10=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_majorview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setMajorId(rs.getString("jy_id10"));
                record.setMajorName(rs.getString("jy_major10"));
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
            str = " WHERE jy_course_number10=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_name10=?;";
        } else if (opt.equals("3")) {
            str = " WHERE jy_teacher10=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_courseview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("4")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setCourseName(rs.getString("jy_name10"));
                record.setCourseCredit(rs.getString("jy_credit10"));
                record.setCoursePeriod(rs.getString("jy_period10"));
                record.setCourseExamination(rs.getString("jy_examination10"));
                record.setCourseNumber(rs.getString("jy_course_number10"));
                record.setCourseId(rs.getString("jy_id10"));
                record.setClassName(rs.getString("jy_class_name10"));
                record.setCourseTerm(rs.getString("jy_term10"));
                record.setTeacherName(rs.getString("jy_teacher10"));
                record.setCourseDetail(rs.getString("jy_detail10"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }
}
