package com.example.db;

import java.util.ArrayList;

public interface StudentDao extends Dao {
    public ArrayList<Record> queryClassCourse(String opt, String text);

    public ArrayList<Record> queryTeacherCourse(String opt, String text);

    public ArrayList<Record> queryScore(String opt, String username);

    public ArrayList<Record> queryCredit(String opt, String username);

    public ArrayList<Record> queryOwnCourse(String opt, String text);
}
