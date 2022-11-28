package com.dao;

import com.entity.EventSuggestIdeas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.io.*;

import com.entity.EventType;

public class EventTypeDao {

    private Connection conn;

    public EventTypeDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addEventType(String eventTypeName, String eventTypeDescription, String status) {
        boolean f = false;

        try {
            String sql = "insert into event_type(event_type_name ,event_type_description,event_type_status) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, eventTypeName);
            ps.setString(2, eventTypeDescription);
            ps.setString(3, status);

//            ArrayList<EventType> list = getAllAvailableType();
//            for (EventType type : list) {
//                if (eventTypeName.equals(type.getEventTypeName())) {
//                    f = false;
//                    break;
//                } else {
//                    f = true;
//
//                }
//            }
//            if (f = true) {
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
//                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateEventType(String eventTypeName, String eventTypeDescription, String status, int Id) {
        boolean f = false;

        try {
            String sql = "update event_type set event_type_name=? ,event_type_description=?,event_type_status=? where event_type_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, eventTypeName);
            ps.setString(2, eventTypeDescription);
            ps.setString(3, status);
            ps.setInt(4, Id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
//                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public EventType getEventTypeById(int id) {
        EventType ev = null;
        try {
            String sql = "select * from event_type where event_type_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ev = new EventType();
                ev.setId(rs.getInt("event_type_id"));
                ev.setEventTypeName(rs.getString("event_type_name"));
                ev.setEventTypeDescription(rs.getString("event_type_description"));
                ev.setStatus(rs.getString("event_type_status"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ev;
    }

    public ArrayList<EventType> getAllType() {
        ArrayList<EventType> list = new ArrayList<>();
        EventType s = null;

        try {
            String sql = "select * from event_type";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s = new EventType();
                s.setId(rs.getInt("event_type_id"));
                s.setEventTypeName(rs.getString("event_type_name"));
                s.setEventTypeDescription(rs.getString("event_type_description"));
                s.setStatus(rs.getString("event_type_status"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<EventType> getAllAvailableType() {
        ArrayList<EventType> list = new ArrayList<>();
        EventType s = null;

        try {
            String sql = "select * from event_type where event_type_status='Available'";
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Available");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s = new EventType();
                s.setId(rs.getInt("event_type_id"));
                s.setEventTypeName(rs.getString("event_type_name"));
                s.setEventTypeDescription(rs.getString("event_type_description"));
                s.setStatus(rs.getString("event_type_status"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList getListEventByPagination(ArrayList<EventType> list, int start, int end) {
        ArrayList<EventType> result = new ArrayList<EventType>();
        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
}
