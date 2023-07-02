package com.example.db;

import java.util.ArrayList;

public interface TeacherDao extends Dao {

    public ArrayList<Record> queryTeacherCourse(String opt, String text);

    public ArrayList<Record> queryScoreAvg(String opt, String text);

    public ArrayList<Record> queryScoreRank(String opt, String text);

    public Boolean importStudent(Record record);
}
