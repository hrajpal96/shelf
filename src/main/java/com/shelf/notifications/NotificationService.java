/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.notifications;

import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Asus
 */
public class NotificationService {

    private static JdbcRowSet rowSet = null;

    public NotificationService(ServletContext context) {
        try {
            ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
            rowSet = new JdbcRowSetImpl(conn.getConnection());
        } catch (SQLException ex) {
            Logger.getLogger(NotificationService.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void addNotificationToDatabase(UserNotificationBean notification, Timestamp timestamp) {
        try {

            rowSet.setCommand("SELECT * from usernotifications");
            rowSet.setReadOnly(false);
//             Fills this RowSet object with data. 
            rowSet.execute();
            rowSet.moveToInsertRow();
            rowSet.updateLong("uid", notification.getuserID());
            rowSet.updateLong("notification_id", notification.getNotificationID());
            rowSet.updateString("notification_message", notification.getMessage());
            rowSet.updateTimestamp("generatedtimestamp", timestamp);
            rowSet.updateBoolean("readstatus", false);
            rowSet.insertRow();
            rowSet.first();

        } catch (SQLException ex) {
            Logger.getLogger(NotificationService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public UserNotificationBean addNotificationToBean(UserNotificationBean notification) {
        try {
            rowSet.setCommand("SELECT * from usernotifications where uid = " + notification.getuserID());
            rowSet.setReadOnly(false);

//             Fills this RowSet object with data. 
            rowSet.execute();
            Map<Timestamp, String> message = notification.getMessagecount();
            rowSet.first();
            while (rowSet.next()) {
                message.put(rowSet.getTimestamp("generatedtimestamp"), rowSet.getString("notification_message"));

            }
            notification.setMessagecount(message);
        } catch (SQLException ex) {
            Logger.getLogger(NotificationService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notification;
    }
}
