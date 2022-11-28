package com.entity;

import java.io.Serializable;
import java.sql.Date;

public class EventSuggestIdeas implements Serializable {

    private int id;
    private int studentId;
    private int eventTypeId;
    private String title;
    private String location;
    private String description;
    private String submitDate;
    private String image;
    private String status;

    public EventSuggestIdeas() {
        super();
    }

    public EventSuggestIdeas(int id, int studentId, int eventTypeId, String title, String location, String description, String submitDate, String image, String status) {
        this.id = id;
        this.studentId = studentId;
        this.eventTypeId = eventTypeId;
        this.title = title;
        this.location = location;
        this.description = description;
        this.submitDate = submitDate;
        this.image = image;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getEventTypeId() {
        return eventTypeId;
    }

    public void setEventTypeId(int eventTypeId) {
        this.eventTypeId = eventTypeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(String submitDate) {
        this.submitDate = submitDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
