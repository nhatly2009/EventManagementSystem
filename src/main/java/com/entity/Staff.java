package com.entity;

import java.io.Serializable;

public class Staff implements Serializable {

    private int staffId;
    private String username;
    private String password;
    private String email;
    private String name;
    private String phoneNumber;
    private String image;
    private String status;

    public Staff(String username, String password, String name, String status) {
        super();

        this.username = username;
        this.password = password;
        this.name = name;
        this.status = status;
    }

    public Staff() {
        super();
    }

    public Staff(int staffId, String username, String password, String email, String name, String phoneNumber,
            String image, String status) {
        super();
        this.staffId = staffId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.image = image;
        this.status = status;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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
