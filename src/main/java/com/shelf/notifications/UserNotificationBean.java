/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.notifications;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Harsh
 */
public class UserNotificationBean implements Serializable{
    private int userId;
    Map<Timestamp,String> message;
  

    public UserNotificationBean() {
        message=new HashMap<>();
        
    }

    public int getCount()
    {
        return message.size();
    }
  
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Map<Timestamp,String> getMessage() {
        return message;
    }

    public void setMessage(Map<Timestamp,String> message) {
        this.message = message;
    }
    
}
