/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.notifications;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Map;

/**
 *
 * @author Harsh
 */
public class UserNotificationBean implements Serializable {

    private Integer userid;
    private Integer notificationID;
    private Timestamp generation_time;
    private String message;
    private Boolean readstatus;
    Map<Timestamp,String> messagecount;
    int count;

    public int getCount() {
        return messagecount.size();
    }


    public Map<Timestamp, String> getMessagecount() {
        return messagecount;
    }

    public void setMessagecount(Map<Timestamp, String> messagecount) {
        this.messagecount = messagecount;
    }
    public Integer getuserID() {
        return userid;
    }

    public void setuserID(Integer userid) {
        this.userid = userid;
    }

    public Integer getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(Integer notificationID) {
        this.notificationID = notificationID;
    }

    public Timestamp getGeneration_time() {
        return generation_time;
    }

    public void setGeneration_time(Timestamp generation_time) {
        this.generation_time = generation_time;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getReadstatus() {
        return readstatus;
    }

    public void setReadstatus(Boolean readstatus) {
        this.readstatus = readstatus;
    }

}
