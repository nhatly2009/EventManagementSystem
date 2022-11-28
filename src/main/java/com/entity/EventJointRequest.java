package com.entity;

import java.awt.Image;
import java.io.Serializable;

public class EventJointRequest implements Serializable {

    private int student_id;
    private int event_id;
    private String date_sent;
    private String update_by;
    private String status;

    public EventJointRequest() {
        super();
    }

    public EventJointRequest(int student_id, int event_id, String date_sent, String update_by, String status) {
        this.student_id = student_id;
        this.event_id = event_id;
        this.date_sent = date_sent;
        this.update_by = update_by;
        this.status = status;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getDate_sent() {
        return date_sent;
    }

    public void setDate_sent(String date_sent) {
        this.date_sent = date_sent;
    }

    public String getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(String update_by) {
        this.update_by = update_by;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
