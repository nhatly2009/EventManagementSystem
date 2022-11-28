package com.entity;

import java.awt.Image;
import java.io.Serializable;

public class Event implements Serializable {

    private int id;
    private String title;
    private int typeId;
    private String location;
    private String description;
    private String dateStart;
    private String dateForJointRequest;

    private String image;
    private int staffId;
    private String status;

    public Event() {
        super();
    }

    public Event( String title, int typeId, String location, String description, String dateStart,
            String dateForJointRequest, String image, int staffId,
            String status) {
        super();
      
        this.title = title;
        this.typeId = typeId;
        this.location = location;
        this.description = description;
        this.dateStart = dateStart;
        this.dateForJointRequest = dateForJointRequest;
        this.image = image;
        this.staffId = staffId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getType() {
        return typeId;
    }

    public void setType(int typeId) {
        this.typeId = typeId;
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

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateForJointRequest() {
        return dateForJointRequest;
    }

    public void setDateForJointRequest(String dateForJointRequest) {
        this.dateForJointRequest = dateForJointRequest;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
