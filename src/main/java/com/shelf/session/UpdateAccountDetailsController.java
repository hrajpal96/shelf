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
import java.util.UUID;
import javax.servlet.ServletContext;

public class UpdateAccountDetailsController {

    public UserBean updateUser(String email, String firstName, String lastName, String phoneNumber, UserBean user, ServletContext context) {
        ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
        String verificationKey = null;
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
            if (email != null) {
                rowSet.updateString("emailID", email);
                if (!email.equals(user.getEmailID())) {
                    verificationKey = UUID.randomUUID().toString();
                    rowSet.updateString("verification_key", verificationKey);
                    if (user.isIsValid()) {
                        rowSet.updateBoolean("isValid", false);
                    }
                    if (!(firstName.equals(user.getFirstName())) || !(lastName.equals(user.getLastName())) || !(phoneNumber.equals(user.getContactNumber()))) {
                        user.setUpdated(true);
                    }
                }

            }
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
            user.setVerificationkey(rowSet.getString("verification_key"));
            user.setIsValid(rowSet.getBoolean("isValid"));
            rowSet.beforeFirst();
        } catch (SQLException ex) {
            if (ex.getMessage().contains("emailID") && ex.getMessage().contains("Duplicate")) {
                user.setUpdated(false);
            }
            if (ex.getMessage().contains("contactNumber") && ex.getMessage().contains("Duplicate")) {
                user.setUpdated(false);
            }
        }

        return user;
    }
}
