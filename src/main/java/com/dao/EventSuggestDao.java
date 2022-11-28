package com.dao;

import com.entity.EventJointRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.entity.EventSuggestIdeas;

public class EventSuggestDao {

    private Connection conn;

    public EventSuggestDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addEventSuggestIdeas(int studentId, int eventTypeID, String title, String location, String description, String submitDate, String status) {
        boolean f = false;

        try {
            String sql = "insert into event_suggest(student_id, event_type_id, event_suggest_title, event_suggest_location, event_suggest_description, event_suggest_submit_date,  event_suggest_status) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.setInt(2, eventTypeID);

            ps.setString(3, title);
            ps.setString(4, location);
            ps.setString(5, description);
            ps.setString(6, submitDate);

            ps.setString(7, status);
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

    public boolean updateEventStatus(String status, int Id) {
        boolean f = false;

        try {
            String sql = "update event_suggest set event_suggest_status=? where event_suggest_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, Id);
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

    public EventSuggestIdeas getEventById(int id) {
        EventSuggestIdeas es = null;
        try {
            String sql = "select * from event_suggest where event_suggest_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                es = new EventSuggestIdeas();
                es.setId(rs.getInt(1));
                es.setStudentId(rs.getInt(2));
                es.setEventTypeId(rs.getInt(3));
                es.setTitle(rs.getString(4));
                es.setLocation(rs.getString(5));
                es.setDescription(rs.getString(6));
                es.setSubmitDate(rs.getString(7));

                es.setStatus(rs.getString(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return es;
    }

    public ArrayList<EventSuggestIdeas> getAllEventSuggestByStudentID(int s_id) {
        ArrayList<EventSuggestIdeas> list = new ArrayList<>();
        EventSuggestIdeas es = null;

        try {
            String sql = "select * from event_suggest where student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, s_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                es = new EventSuggestIdeas();
                es.setId(rs.getInt(1));
                es.setStudentId(rs.getInt(2));
                es.setEventTypeId(rs.getInt(3));
                es.setTitle(rs.getString(4));
                es.setLocation(rs.getString(5));
                es.setDescription(rs.getString(6));
                es.setSubmitDate(rs.getString(7));

                es.setStatus(rs.getString(8));

                list.add(es);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<EventSuggestIdeas> getAllEventSuggest() {
        ArrayList<EventSuggestIdeas> list = new ArrayList<>();
        EventSuggestIdeas es = null;

        try {
            String sql = "select * from event_suggest";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                es = new EventSuggestIdeas();
                es.setId(rs.getInt(1));
                es.setStudentId(rs.getInt(2));
                es.setEventTypeId(rs.getInt(3));
                es.setTitle(rs.getString(4));
                es.setLocation(rs.getString(5));
                es.setDescription(rs.getString(6));
                es.setSubmitDate(rs.getString(7));

                es.setStatus(rs.getString(8));

                list.add(es);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList getListEventByPagination(ArrayList<EventSuggestIdeas> list, int start, int end) {
        ArrayList<EventSuggestIdeas> result = new ArrayList<EventSuggestIdeas>();
        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
}
