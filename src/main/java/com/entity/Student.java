package com.entity;

import java.io.Serializable;

public class Student implements Serializable {

    private int studentId;
    private String studentUsername;
    private String password;
    private String studentEmail;
    private String studentName;
    private String studentPhoneNumber;
    private String studentMajor;
    private String studentImage;
    private String studentStatus;

    public Student() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Student(int studentId, String studentUsername, String password, String studentEmail, String studentName,
            String studentStatus) {
        super();
        this.studentId = studentId;
        this.studentUsername = studentUsername;
        this.password = password;
        this.studentEmail = studentEmail;
        this.studentName = studentName;
        this.studentStatus = studentStatus;
    }

    public Student(int studentId, String studentEmail, String studentName,
            String studentPhoneNumber, String studentMajor, String studentImage, String studentStatus) {
        super();
        this.studentId = studentId;
        this.studentEmail = studentEmail;
        this.studentName = studentName;

        this.studentPhoneNumber = studentPhoneNumber;
        this.studentMajor = studentMajor;
        this.studentImage = studentImage;
        this.studentStatus = studentStatus;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentUsername() {
        return studentUsername;
    }

    public void setStudentUsername(String studentUsername) {
        this.studentUsername = studentUsername;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentPhoneNumber() {
        return studentPhoneNumber;
    }

    public void setStudentPhoneNumber(String studentPhoneNumber) {
        this.studentPhoneNumber = studentPhoneNumber;
    }

    public String getStudentMajor() {
        return studentMajor;
    }

    public void setStudentMajor(String studentMajor) {
        this.studentMajor = studentMajor;
    }

    public String getStudentImage() {
        return studentImage;
    }

    public void setStudentImage(String studentImage) {
        this.studentImage = studentImage;
    }

    public String getStudentStatus() {
        return studentStatus;
    }

    public void setStudentStatus(String studentStatus) {
        this.studentStatus = studentStatus;
    }

}
