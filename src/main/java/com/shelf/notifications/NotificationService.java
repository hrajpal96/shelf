/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.notifications;

import com.shelf.notifications.UserNotificationBean;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.JdbcRowSet;
import javax.sql.rowset.RowSetProvider;

/**
 *
 * @author Asus
 */
public class NotificationService {

    private final static String DB_DRIVER_CLASS = "com.mysql.jdbc.Driver";
    private final static String DB_URL = "jdbc:mysql://manoj:3306/doso";
    private final static String DB_USERNAME = "root";
    private final static String DB_PASSWORD = "root";
    private static JdbcRowSet rowSet = null;

    public NotificationService() {
        try {
            Class.forName(DB_DRIVER_CLASS);
            rowSet = RowSetProvider.newFactory().createJdbcRowSet();

//           rowSet=new JdbcRowSetImpl(conn);
//            System.out.println(rowSet.getDataSourceName());
            rowSet.setUrl(DB_URL);

            rowSet.setUsername(DB_USERNAME);
            rowSet.setPassword(DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NotificationService.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void addNotificationToDatabase(UserNotificationBean notification, Timestamp timestamp) {
        try {

            rowSet.setCommand("SELECT * from notifications");
//            System.out.println("query fired");
            rowSet.setReadOnly(false);
//             Fills this RowSet object with data. 
            rowSet.execute();
            rowSet.moveToInsertRow();
            rowSet.updateInt("user_id", notification.getUserId());
            rowSet.updateString("message", notification.getMessage().get(timestamp));
            rowSet.updateTimestamp("timestamp", timestamp);
            rowSet.insertRow();
            rowSet.first();

        } catch (SQLException ex) {
            Logger.getLogger(NotificationService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public UserNotificationBean addNotificationToBean(UserNotificationBean notification) {
        try {
            rowSet.setCommand("SELECT * from notifications where user_id = " + notification.getUserId());
            rowSet.setReadOnly(false);
//             Fills this RowSet object with data. 
            rowSet.execute();
            Map<Timestamp, String> message = notification.getMessage();
            while (rowSet.next()) {
                message.put(rowSet.getTimestamp("timestamp"), rowSet.getString("message"));

            }
            notification.setMessage(message);
            rowSet.first();

        } catch (SQLException ex) {
            Logger.getLogger(NotificationService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notification;
    }
}
