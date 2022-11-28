package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.entity.Event;

public class EventDao {

    private Connection conn;

    public EventDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addEvent(String eventTitle, int eventTypeID, String eventLocation, String eventDescription, String dateStart, String dateForJointRequest, String eventImage, int staffId, String status) {
        boolean f = false;

        try {
            String sql = "insert into event(event_type_id, event_title, event_location, event_description, event_date_start, event_date_for_jointRequest, event_image, staff_id, event_status) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, eventTypeID);
            ps.setString(2, eventTitle);

            ps.setString(3, eventLocation);
            ps.setString(4, eventDescription);
            ps.setString(5, dateStart);
            ps.setString(6, dateForJointRequest);
            ps.setString(7, eventImage);
            ps.setInt(8, staffId);
            ps.setString(9, status);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateEvent(String eventTitle, int eventTypeID, String eventLocation, String eventDescription, String dateStart, String dateForJointRequest, String eventImage, int staffId, String status, int eventId) {
        boolean f = false;

        try {
            String sql = "update event set event_type_id=? , event_title=? , event_location=? , event_description=? , event_date_start=? , event_date_for_jointRequest=? , event_image=? , staff_id =?, event_status=? where event_id =?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, eventTypeID);
            ps.setString(2, eventTitle);

            ps.setString(3, eventLocation);
            ps.setString(4, eventDescription);
            ps.setString(5, dateStart);
            ps.setString(6, dateForJointRequest);
            ps.setString(7, eventImage);
            ps.setInt(8, staffId);
            ps.setString(9, status);
            ps.setInt(10, eventId);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int getNextEventId() {
        int id = 0;
        try {
            String sql = "SELECT AUTO_INCREMENT\n"
                    + "FROM information_schema.tables\n"
                    + "WHERE table_name = 'event'\n"
                    + "AND table_schema = 'projectb'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public Event getEventById(int id) {
        Event event = null;
        try {
            String sql = "select * from event where event_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                event = new Event();
                event.setId(rs.getInt("event_id"));
                event.setTitle(rs.getString("event_title"));
                event.setType(rs.getInt("event_type_id"));
                event.setLocation(rs.getString("event_location"));
                event.setDescription(rs.getString("event_description"));
                event.setDateStart(rs.getString("event_date_start"));
                event.setDateForJointRequest(rs.getString("event_date_for_jointRequest"));
                event.setImage(rs.getString("event_image"));
                event.setStaffId(rs.getInt("staff_id"));
                event.setStatus(rs.getString("event_status"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return event;
    }

    public ArrayList<Event> getAllEventAvailable() {
        ArrayList<Event> list = new ArrayList<>();
        Event event = null;

        try {
            String sql = "select * from event where event_status='Available'";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                event = new Event();
                event.setId(rs.getInt("event_id"));
                event.setTitle(rs.getString("event_title"));
                event.setType(rs.getInt("event_type_id"));
                event.setLocation(rs.getString("event_location"));
                event.setDescription(rs.getString("event_description"));
                event.setDateStart(rs.getString("event_date_start"));
                event.setDateForJointRequest(rs.getString("event_date_for_jointRequest"));
                event.setImage(rs.getString("event_image"));
                event.setStaffId(rs.getInt("staff_id"));
                event.setStatus(rs.getString("event_status"));

                list.add(event);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<Event> getAllEvent() {
        ArrayList<Event> list = new ArrayList<>();
        Event event = null;

        try {
            String sql = "select * from event";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                event = new Event();
                event.setId(rs.getInt("event_id"));
                event.setTitle(rs.getString("event_title"));
                event.setType(rs.getInt("event_type_id"));
                event.setLocation(rs.getString("event_location"));
                event.setDescription(rs.getString("event_description"));
                event.setDateStart(rs.getString("event_date_start"));
                event.setDateForJointRequest(rs.getString("event_date_for_jointRequest"));
                event.setImage(rs.getString("event_image"));
                event.setStaffId(rs.getInt("staff_id"));
                event.setStatus(rs.getString("event_status"));

                list.add(event);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList getListEventByPagination(ArrayList<Event> list, int start, int end) {
        ArrayList<Event> result = new ArrayList<Event>();
        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
}
