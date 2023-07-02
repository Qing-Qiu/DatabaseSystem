package com.example.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TeacherDaoImpl implements TeacherDao {
    @Override
    public ArrayList<Record> queryTeacherCourse(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_teacher10=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_teacher_id10=?";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_courseview10" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("3")) {
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

    @Override
    public ArrayList<Record> queryScoreAvg(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE x.jy_course_id10=? ";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT x.jy_course_id10, ROUND(AVG(x.jy_value10), 2) AS jy_avg10, y.jy_course10 " +
                    "FROM jiangy_scoreview10 x " +
                    "JOIN jiangy_scoreview10 y ON x.jy_course_id10 = y.jy_course_id10 " +
                    str +
                    "GROUP BY x.jy_course_id10, y.jy_course10;";
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setCourseId(rs.getString("jy_course_id10"));
                record.setCourseName(rs.getString("jy_course10"));
                record.setScoreValue(rs.getString("jy_avg10"));
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public ArrayList<Record> queryScoreRank(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE jy_course10=? ";
        } else if (opt.equals("2")) {
            str = " WHERE jy_course_id10=?";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT jy_name10,jy_course10,jy_course_id10,jy_value10,jy_teacher10 FROM jiangy_scoreview10 " + str + " ORDER BY jy_value10 DESC";
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("3")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            int rank = 1;
            while (rs.next()) {
                Record record = new Record();
                record.setStudentName(rs.getString("jy_name10"));
                record.setCourseName(rs.getString("jy_course10"));
                record.setCourseId(rs.getString("jy_course_id10"));
                record.setScoreValue(rs.getString("jy_value10"));
                record.setTeacherName(rs.getString("jy_teacher10"));
                record.setCount(Integer.toString(rank));
                rank++;
                records.add(record);
            }
            Dao.closeAll(conn, stat, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return records;
    }

    @Override
    public Boolean importStudent(Record record) {
        String sql = "INSERT INTO jiangy_score10 VALUES(?,?,?);";
        try {
            Connection conn = getConnection();
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, record.getCourseId());
            stat.setString(2, record.getStudentId());
            stat.setString(3, record.getScoreValue());
            int rows = stat.executeUpdate();
            Dao.closeAll(conn, stat, null);
            if (rows != 0) return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
