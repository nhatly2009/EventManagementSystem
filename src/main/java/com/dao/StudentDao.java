package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entity.Student;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class StudentDao {

    private Connection conn;

    public StudentDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean register(Student u) {
        boolean f = false;

        try {

            String sql = "insert into student(student_id, student_username, student_password, student_email, student_fullname, student_status) values(?,?,?,?,?,?) ";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, u.getStudentId());
            ps.setString(2, u.getStudentUsername());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getStudentEmail());
            ps.setString(5, u.getStudentName());
            ps.setString(6, u.getStudentStatus());
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Student login(String username, String psw) {
        Student u = null;
        String status = "Available";
        try {
            String sql = "select * from student where student_username=? and student_password=? and student_status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, psw);
            ps.setString(3, status);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new Student();
                u.setStudentId(rs.getInt(1));
                u.setStudentUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setPassword(rs.getString(5));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    public boolean updateStatus(String status, int userid) {
        boolean f = false;

        try {
            String sql = "update student set student_status=?  where student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, userid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateProfile(String name, String email, String major, String phone, int userid) {
        boolean f = false;

        try {
            String sql = "update student set student_fullname=? , student_email=?, student_major =?, student_phone=? where student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, major);
            ps.setString(4, phone);
            ps.setInt(5, userid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateImage(String image, String username) {
        boolean f = false;

        try {
            String sql = "update student set student_image=?  where student_username=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, image);
            ps.setString(2, username);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean checkOldPassword(int userid, String oldPassword) {
        boolean f = false;

        try {
            String sql = "select * from user_list where id=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean changePassword(int userid, String newPassword) {
        boolean f = false;

        try {
            String sql = "update user_list set password=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Student getStudentById(int id) {
        Student student = null;
        try {
            String sql = "select * from student where student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                student = new Student();
                student.setStudentId(rs.getInt(1));
                student.setStudentUsername(rs.getString(2));
                student.setPassword(rs.getString(3));
                student.setStudentEmail(rs.getString(4));
                student.setStudentName(rs.getString(5));

                student.setStudentPhoneNumber(rs.getString(6));
                student.setStudentMajor(rs.getString(7));
                student.setStudentImage(rs.getString(8));
                student.setStudentStatus(rs.getString(9));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    public ArrayList<Student> getAllUser() {
        ArrayList<Student> list = new ArrayList<Student>();
        Student student = null;
        try {

            String sql = "select * from student order by student_id asc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                student = new Student();
                student.setStudentId(rs.getInt(1));
                student.setStudentUsername(rs.getString(2));
                student.setPassword(rs.getString(3));
                student.setStudentEmail(rs.getString(4));
                student.setStudentName(rs.getString(5));

                student.setStudentPhoneNumber(rs.getString(6));
                student.setStudentMajor(rs.getString(7));
                student.setStudentImage(rs.getString(8));
                student.setStudentStatus(rs.getString(9));
                list.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList getListEventByPagination(ArrayList<Student> list, int start, int end) {
        ArrayList<Student> result = new ArrayList<Student>();
        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
}
