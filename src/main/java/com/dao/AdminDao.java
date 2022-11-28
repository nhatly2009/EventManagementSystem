package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Admin;
import com.entity.Staff;
import com.entity.Student;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

public class AdminDao {

    private Connection conn;

    public AdminDao(Connection conn) {
        super();
        this.conn = conn;

    }

    public Admin login(String username, String psw) {
        Admin admin = null;

        try {
            String sql = "select * from admin where admin_username=? and admin_password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                admin = new Admin();
                admin.setUsername(rs.getString(1));
                admin.setPassword(rs.getString(2));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }

    public int countEvent() {
        int i = 0;
        try {
            String sql = "select * from event";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public int countEventJointRequest() {
        int i = 0;
        try {
            String sql = "select * from event_joint_request";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public int countEventSuggestIdeas() {
        int i = 0;
        try {
            String sql = "select * from event_suggest";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public int countStaffAccount() {
        int i = 0;
        try {
            String sql = "select * from staff";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public int countStudentAccount() {
        int i = 0;
        try {
            String sql = "select * from student";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public String md5(String str) {
        MessageDigest md;
        String result = "";
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            BigInteger bi = new BigInteger(1, md.digest());

            result = bi.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean isCheckUsernameStudent(String username, ArrayList<Student> listStudent) {
        boolean isCheckUsername = false;
        if (username.equals("admin")) {
            isCheckUsername = false;
        } else {
            for (int i = 0; i < listStudent.size(); i++) {
                if (listStudent.get(i).getStudentUsername().equals(username)) {
                    isCheckUsername = false;
                    break;
                } else {
                    isCheckUsername = true;
                }
            }
        }
        return isCheckUsername;
    }

    public boolean isCheckUsernameStaff(String username, ArrayList<Staff> listStaff) {
        boolean isCheckUsername = false;
        if (username.equals("admin")) {
            isCheckUsername = false;
        } else {
            for (int i = 0; i < listStaff.size(); i++) {
                if (listStaff.get(i).getUsername().equals(username)) {
                    isCheckUsername = false;
                    break;
                } else {
                    isCheckUsername = true;
                }
            }
        }
        return isCheckUsername;
    }

    
}
