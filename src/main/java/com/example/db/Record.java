package com.example.db;

public class Record {
    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseTerm() {
        return courseTerm;
    }

    public void setCourseTerm(String courseTerm) {
        this.courseTerm = courseTerm;
    }

    public String getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(String courseCredit) {
        this.courseCredit = courseCredit;
    }

    public String getCoursePeriod() {
        return coursePeriod;
    }

    public void setCoursePeriod(String coursePeriod) {
        this.coursePeriod = coursePeriod;
    }

    public String getCourseExamination() {
        return courseExamination;
    }

    public void setCourseExamination(String courseExamination) {
        this.courseExamination = courseExamination;
    }

    public String getCourseDetail() {
        return courseDetail;
    }

    public void setCourseDetail(String courseDetail) {
        this.courseDetail = courseDetail;
    }

    public String getCourseTeacherId() {
        return courseTeacherId;
    }

    public void setCourseTeacherId(String courseTeacherId) {
        this.courseTeacherId = courseTeacherId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentMajorId() {
        return studentMajorId;
    }

    public void setStudentMajorId(String studentMajorId) {
        this.studentMajorId = studentMajorId;
    }

    public String getStudentClassName() {
        return studentClassName;
    }

    public void setStudentClassName(String studentClassName) {
        this.studentClassName = studentClassName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(String studentAge) {
        this.studentAge = studentAge;
    }

    public String getStudentRegion() {
        return studentRegion;
    }

    public void setStudentRegion(String studentRegion) {
        this.studentRegion = studentRegion;
    }

    public String getStudentCredits() {
        return studentCredits;
    }

    public void setStudentCredits(String studentCredits) {
        this.studentCredits = studentCredits;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherSex() {
        return teacherSex;
    }

    public void setTeacherSex(String teacherSex) {
        this.teacherSex = teacherSex;
    }

    public String getTeacherAge() {
        return teacherAge;
    }

    public void setTeacherAge(String teacherAge) {
        this.teacherAge = teacherAge;
    }

    public String getTeacherTitle() {
        return teacherTitle;
    }

    public void setTeacherTitle(String teacherTitle) {
        this.teacherTitle = teacherTitle;
    }

    public String getTeacherPhone() {
        return teacherPhone;
    }

    public void setTeacherPhone(String teacherPhone) {
        this.teacherPhone = teacherPhone;
    }

    public String getScoreValue() {
        return scoreValue;
    }

    public void setScoreValue(String scoreValue) {
        this.scoreValue = scoreValue;
    }

    public String getMajorId() {
        return majorId;
    }

    public void setMajorId(String majorId) {
        this.majorId = majorId;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }


    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getGpa() {
        return gpa;
    }

    public void setGpa(String gpa) {
        this.gpa = gpa;
    }

    private String courseNumber;
    private String courseId;
    private String courseName;
    private String courseTerm;
    private String courseCredit;
    private String coursePeriod;
    private String courseExamination;
    private String courseDetail;
    private String courseTeacherId;
    private String studentId;
    private String studentMajorId;
    private String studentClassName;
    private String studentName;
    private String studentSex;
    private String studentAge;
    private String studentRegion;
    private String studentCredits;
    private String teacherId;
    private String teacherName;
    private String teacherSex;
    private String teacherAge;
    private String teacherTitle;
    private String teacherPhone;
    private String scoreValue;
    private String majorId;
    private String majorName;
    private String className;
    private String grade;
    private String count;
    private String gpa;

    public Record() {
    }

    public Record(String courseNumber, String courseId, String courseName, String courseTerm, String courseCredit, String coursePeriod, String courseExamination, String courseDetail, String courseTeacherId, String studentId, String studentMajorId, String studentClassName, String studentName, String studentSex, String studentAge, String studentRegion, String studentCredits, String teacherId, String teacherName, String teacherSex, String teacherAge, String teacherTitle, String teacherPhone, String scoreValue, String majorId, String majorName, String className, String grade, String count, String gpa) {
        this.courseNumber = courseNumber;
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseTerm = courseTerm;
        this.courseCredit = courseCredit;
        this.coursePeriod = coursePeriod;
        this.courseExamination = courseExamination;
        this.courseDetail = courseDetail;
        this.courseTeacherId = courseTeacherId;
        this.studentId = studentId;
        this.studentMajorId = studentMajorId;
        this.studentClassName = studentClassName;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentAge = studentAge;
        this.studentRegion = studentRegion;
        this.studentCredits = studentCredits;
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherSex = teacherSex;
        this.teacherAge = teacherAge;
        this.teacherTitle = teacherTitle;
        this.teacherPhone = teacherPhone;
        this.scoreValue = scoreValue;
        this.majorId = majorId;
        this.majorName = majorName;
        this.className = className;
        this.grade = grade;
        this.count = count;
        this.gpa = gpa;
    }
}
