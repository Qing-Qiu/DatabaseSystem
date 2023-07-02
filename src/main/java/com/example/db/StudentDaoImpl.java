package com.example.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentDaoImpl implements StudentDao {
    @Override
    public ArrayList<Record> queryClassCourse(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_class_name=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_courseview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
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

    @Override
    public ArrayList<Record> queryTeacherCourse(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_teacher=?;";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_courseview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
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

    @Override
    public ArrayList<Record> queryScore(String opt, String username) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        try {
            Connection conn = getConnection();
            if (!opt.equals("9")) {
                if (opt.equals("1")) str = "\'大一上\'";
                else if (opt.equals("2")) str = "\'大一下\'";
                else if (opt.equals("3")) str = "\'大二上\'";
                else if (opt.equals("4")) str = "\'大二下\'";
                else if (opt.equals("5")) str = "\'大三上\'";
                else if (opt.equals("6")) str = "\'大三下\'";
                else if (opt.equals("7")) str = "\'大四上\'";
                else if (opt.equals("8")) str = "\'大四下\'";
                str = " AND jy_term=" + str;
            }
            String sql = "SELECT * FROM jiangy_scoreview WHERE jy_id=?" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, username);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentId(rs.getString("jy_id"));
                record.setStudentName(rs.getString("jy_name"));
                record.setCourseName(rs.getString("jy_course"));
                record.setScoreValue(rs.getString("jy_value"));
                record.setTeacherName(rs.getString("jy_teacher"));
                record.setCourseTerm(rs.getString("jy_term"));
                record.setClassName(rs.getString("jy_class_name"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryCredit(String opt, String username) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        try {
            Connection conn = getConnection();
            if (!opt.equals("9")) {
                if (opt.equals("1")) str = "\'大一上\'";
                else if (opt.equals("2")) str = "\'大一下\'";
                else if (opt.equals("3")) str = "\'大二上\'";
                else if (opt.equals("4")) str = "\'大二下\'";
                else if (opt.equals("5")) str = "\'大三上\'";
                else if (opt.equals("6")) str = "\'大三下\'";
                else if (opt.equals("7")) str = "\'大四上\'";
                else if (opt.equals("8")) str = "\'大四下\'";
                str = " AND jy_term=" + str;
            }
            String sql = "SELECT * FROM jiangy_creditview WHERE jy_id=?" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, username);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentName(rs.getString("jy_name"));
                record.setStudentCredits(rs.getString("jy_credits"));
                record.setCourseName(rs.getString("jy_course"));
                record.setCourseCredit(rs.getString("jy_credit"));
                record.setCoursePeriod(rs.getString("jy_period"));
                record.setCourseTerm(rs.getString("jy_term"));
                record.setGpa(rs.getString("jy_gpa"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryOwnCourse(String opt, String username) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        try {
            Connection conn = getConnection();
            if (!opt.equals("9")) {
                if (opt.equals("1")) str = "\'大一上\'";
                else if (opt.equals("2")) str = "\'大一下\'";
                else if (opt.equals("3")) str = "\'大二上\'";
                else if (opt.equals("4")) str = "\'大二下\'";
                else if (opt.equals("5")) str = "\'大三上\'";
                else if (opt.equals("6")) str = "\'大三下\'";
                else if (opt.equals("7")) str = "\'大四上\'";
                else if (opt.equals("8")) str = "\'大四下\'";
                str = " AND jy_term=" + str;
            }
            String sql = "SELECT * FROM jiangy_scoreview WHERE jy_id=?" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, username);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setStudentId(rs.getString("jy_id"));
                record.setStudentName(rs.getString("jy_name"));
                record.setCourseName(rs.getString("jy_course"));
                record.setCourseDetail(rs.getString("jy_detail"));
                record.setTeacherName(rs.getString("jy_teacher"));
                record.setCourseTerm(rs.getString("jy_term"));
                record.setClassName(rs.getString("jy_class_name"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }
}
