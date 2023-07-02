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
            str = " WHERE jy_teacher=?;";
        } else if (opt.equals("2")) {
            str = " WHERE jy_teacher_id=?";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT * FROM jiangy_courseview" + str;
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("3")) {
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
    public ArrayList<Record> queryScoreAvg(String opt, String text) {
        ArrayList<Record> records = new ArrayList<>();
        String str = "";
        if (opt.equals("1")) {
            str = " WHERE x.jy_course_id=? ";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT x.jy_course_id, ROUND(AVG(x.jy_value), 2) AS jy_avg, y.jy_course " +
                    "FROM jiangy_scoreview x " +
                    "JOIN jiangy_scoreview y ON x.jy_course_id = y.jy_course_id " +
                    str +
                    "GROUP BY x.jy_course_id, y.jy_course;";
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("2")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                record.setCourseId(rs.getString("jy_course_id"));
                record.setCourseName(rs.getString("jy_course"));
                record.setScoreValue(rs.getString("jy_avg"));
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
            str = " WHERE jy_course=? ";
        } else if (opt.equals("2")) {
            str = " WHERE jy_course_id=?";
        }
        try {
            Connection conn = getConnection();
            text = new String(text.getBytes("iso-8859-1"), "UTF-8");
            String sql = "SELECT jy_name,jy_course,jy_course_id,jy_value,jy_teacher FROM jiangy_scoreview " + str + " ORDER BY jy_value DESC";
            PreparedStatement stat = conn.prepareStatement(sql);
            if (!opt.equals("3")) {
                stat.setString(1, text);
            }
            ResultSet rs = stat.executeQuery();
            int rank = 1;
            while (rs.next()) {
                Record record = new Record();
                record.setStudentName(rs.getString("jy_name"));
                record.setCourseName(rs.getString("jy_course"));
                record.setCourseId(rs.getString("jy_course_id"));
                record.setScoreValue(rs.getString("jy_value"));
                record.setTeacherName(rs.getString("jy_teacher"));
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
        String sql = "INSERT INTO jiangy_score VALUES(?,?,?);";
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
