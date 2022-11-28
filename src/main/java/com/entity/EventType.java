package com.entity;

import java.io.Serializable;

public class EventType implements Serializable {

    private int id;
    private String eventTypeName;
    private String eventTypeDescription;
    private String status;

    public EventType() {
        super();
        // TODO Auto-generated constructor stub
    }

    public EventType(int id, String eventTypeName, String eventTypeDescription, String status) {
        super();
        this.id = id;
        this.eventTypeName = eventTypeName;
        this.eventTypeDescription = eventTypeDescription;
        this.status = status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getEventTypeName() {
        return eventTypeName;
    }

    public void setEventTypeName(String eventTypeName) {
        this.eventTypeName = eventTypeName;
    }

    public String getEventTypeDescription() {
        return eventTypeDescription;
    }

    public void setEventTypeDescription(String eventTypeDescription) {
        this.eventTypeDescription = eventTypeDescription;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
