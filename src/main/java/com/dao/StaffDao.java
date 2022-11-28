package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.Staff;
import com.entity.Student;

public class StaffDao {

    private Connection conn;

    public StaffDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean register(Staff staff) {
        boolean f = false;

        try {

            String sql = "insert into staff(staff_username,staff_password,staff_fullname ,staff_status) values(?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.getUsername());
            ps.setString(2, staff.getPassword());
            ps.setString(3, staff.getName());
            ps.setString(4, staff.getStatus());
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Staff login(String username, String psw) {
        Staff staff = null;
        String status = "Available";
        try {
            String sql = "select * from staff where staff_username=? and staff_password=? and staff_status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, psw);
            ps.setString(3, status);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt(1));
                staff.setUsername(rs.getString(2));
                staff.setPassword(rs.getString(3));
                staff.setEmail(rs.getString(4));
                staff.setName(rs.getString(5));
                staff.setImage(rs.getString(7));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return staff;
    }

    public boolean updateStatus(String status, int userid) {
        boolean f = false;

        try {
            String sql = "update staff set staff_status=? where staff_id=?";
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

    public boolean updateProfile(String name, String email, String phone, int userid) {
        boolean f = false;

        try {
            String sql = "update staff set staff_fullname=? , staff_email=?, staff_phone=? where staff_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);

            ps.setString(3, phone);

            ps.setInt(4, userid);
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
            String sql = "update staff set staff_image=?  where staff_username=?";
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

    public Staff getStaffByUsername(String username) {
        Staff s = null;
        try {
            String sql = "select * from staff where staff_username=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s = new Staff();
                s.setStaffId(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setEmail(rs.getString(4));
                s.setName(rs.getString(5));
                s.setPhoneNumber(rs.getString(6));
                s.setImage(rs.getString(7));
                s.setStatus(rs.getString(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    public Staff getStaffById(int id) {
        Staff s = null;
        try {
            String sql = "select * from staff where staff_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s = new Staff();
                s.setStaffId(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setEmail(rs.getString(4));
                s.setName(rs.getString(5));
                s.setPhoneNumber(rs.getString(6));
                s.setImage(rs.getString(7));
                s.setStatus(rs.getString(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    public ArrayList<Staff> getAllUser() {
        ArrayList<Staff> list = new ArrayList<Staff>();
        Staff staff = null;
        try {

            String sql = "select * from staff order by staff_id asc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt(1));
                staff.setUsername(rs.getString(2));
                staff.setPassword(rs.getString(3));
                staff.setEmail(rs.getString(4));
                staff.setName(rs.getString(5));
                staff.setPhoneNumber(rs.getString(6));
                staff.setImage(rs.getString(7));
                staff.setStatus(rs.getString(8));
                list.add(staff);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList getListEventByPagination(ArrayList<Staff> list, int start, int end) {
        ArrayList<Staff> result = new ArrayList<Staff>();
        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
//    public boolean deleteUser(int id) {
//        boolean f = false;
//        IssueBookDao issueDao = new IssueBookDao(DBConnect.getConn());
//        List<IssueBook> list = null;
//        list = issueDao.getAllIssueBookByLoginUser(id);
//        try {
//            int count = 0;
//            for (int j = 0; j < list.size(); j++) {
//                if (list.get(j).getStatus().equals("Accepted") || list.get(j).getStatus().equals("Pending")) {
//                    count++;
//                }
//            }
//            if (count == 0) {
//                String sql = "delete from user_list where id=?";
//                PreparedStatement ps = conn.prepareStatement(sql);
//                ps.setInt(1, id);
//                int i = ps.executeUpdate();
//                if (i == 1) {
//                    f = true;
//                }
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return f;
//    }
}
