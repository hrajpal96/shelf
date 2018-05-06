/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

/**
 *
 * @author Manoj
 */
import java.sql.SQLException;
import javax.sql.RowSet;
import javax.sql.rowset.JdbcRowSet;
import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import javax.servlet.ServletContext;

public class UpdateAccountDetailsController {

    public UserBean updateUser(String email, String firstName, String lastName, String phoneNumber, UserBean user, ServletContext context) {
        ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
        try {
            JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
            rowSet.setType(RowSet.TYPE_SCROLL_SENSITIVE);
            rowSet.setConcurrency(RowSet.CONCUR_UPDATABLE);
            rowSet.setReadOnly(false);

//             Fills this RowSet object with data.
            System.out.println(user.getUID());
            rowSet.setCommand("SELECT  * FROM `user` WHERE uid = " + user.getUID());
            rowSet.execute();
            rowSet.first();
            rowSet.updateString("emailID", email);
            rowSet.updateString("firstName", firstName);  // Use column number
            rowSet.updateString("lastName", lastName);
            rowSet.updateString("contactNumber", phoneNumber);

            rowSet.updateRow();
            rowSet.absolute(-1);
            user.setUID(rowSet.getInt("uid"));
            user.setEmailID(rowSet.getString("emailID"));
            user.setFirstName(rowSet.getString("firstName"));
            user.setLastName(rowSet.getString("lastName"));
            user.setContactNumber(rowSet.getLong("contactNumber"));

            user.setIsValid(true);
            rowSet.beforeFirst();

        } catch (SQLException ex) {
            System.err.println("Error:" + ex.getMessage());
        }
        return user;
    }
}
