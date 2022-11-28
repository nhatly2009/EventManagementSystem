package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.entity.EventJointRequest;

public class EventJointRequestDao {

    private Connection conn;

    public EventJointRequestDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addEventJointRequest(int studentID, int eventID, String dateSent, String status, String updateby) {
        boolean f = false;

        try {
            String sql = "insert into event_joint_request(student_id, event_id, date_sent, event_joint_request_status,update_by) values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentID);
            ps.setInt(2, eventID);
            ps.setString(3, dateSent);
            ps.setString(4, status);
            ps.setString(5, updateby);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateEventJointRequest(String status, String updateBy, int studentID, int eventID) {
        boolean f = false;

        try {
//            String sql = "SET foreign_key_checks  = 0;\n"
//                    + "update event_joint_request set update_by=?,event_joint_request_status=? where  student_id=? and event_id=?;\n"
//                    + "SET foreign_key_checks  = 1;";
            String sql = "update event_joint_request set update_by=?, event_joint_request_status=? where  student_id=? and event_id=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, updateBy);
            ps.setString(2, status);
            ps.setInt(3, studentID);
            ps.setInt(4, eventID);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public EventJointRequest getEventByStudentId(int s_id) {
        EventJointRequest ev = null;
        try {
            String sql = "select * from event_joint_request where student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, s_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ev = new EventJointRequest();
                ev.setStudent_id(rs.getInt(1));
                ev.setEvent_id(rs.getInt(2));
                ev.setDate_sent(rs.getString(3));
                ev.setStatus(rs.getString(4));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ev;
    }

    public EventJointRequest getEventByStudentId_EventId(int s_id, int e_id) {
        EventJointRequest ev = null;
        try {
            String sql = "select * from event_joint_request where student_id=? and event_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, s_id);
            ps.setInt(2, e_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ev = new EventJointRequest();
                ev.setStudent_id(rs.getInt(1));
                ev.setEvent_id(rs.getInt(2));
                ev.setDate_sent(rs.getString(3));
                ev.setStatus(rs.getString(4));

                ev.setUpdate_by(rs.getString(5));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ev;
    }

    public ArrayList<EventJointRequest> getAllEventJointRequestByStudentID(int s_id) {
        ArrayList<EventJointRequest> list = new ArrayList<>();
        EventJointRequest ejr = null;

        try {
            String sql = "select * from event_joint_request where student_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, s_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ejr = new EventJointRequest();
                ejr.setStudent_id(rs.getInt(1));
                ejr.setEvent_id(rs.getInt(2));
                ejr.setDate_sent(rs.getString(3));
                ejr.setStatus(rs.getString(4));
                ejr.setUpdate_by(rs.getString(5));

                list.add(ejr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<EventJointRequest> getAllEventJointRequest() {
        ArrayList<EventJointRequest> list = new ArrayList<>();
        EventJointRequest ejr = null;

        try {
            String sql = "select * from event_joint_request";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ejr = new EventJointRequest();
                ejr.setStudent_id(rs.getInt(1));
                ejr.setEvent_id(rs.getInt(2));
                ejr.setDate_sent(rs.getString(3));
                ejr.setStatus(rs.getString(4));
                ejr.setUpdate_by(rs.getString(5));

                list.add(ejr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList getListEventByPagination(ArrayList<EventJointRequest> list, int start, int end) {
        ArrayList<EventJointRequest> result = new ArrayList<EventJointRequest>();
        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
}
