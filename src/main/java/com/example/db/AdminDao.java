package com.example.db;

import java.util.ArrayList;

public interface AdminDao extends Dao {
    public boolean updateStudent(String opt, String username, String text);

    public boolean updateTeacher(String opt, String username, String text);

    public boolean updateCourse(String opt, String username, String text);

    public boolean resetPwd(String role, String username);

    public boolean registerNew(String role, Record record);

    public ArrayList<Record> queryRegion(String opt, String text);

    public ArrayList<Record> queryStudent(String opt, String text);

    public ArrayList<Record> queryTeacher(String opt, String text);

    public ArrayList<Record> queryClass(String opt, String text);

    public ArrayList<Record> queryMajor(String opt, String text);

    public ArrayList<Record> queryCourse(String opt, String text);
}
