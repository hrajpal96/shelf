/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.registration;

import com.shelf.session.UserBean;
import com.sun.rowset.JdbcRowSetImpl;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.sql.RowSet;
import javax.sql.rowset.JdbcRowSet;
import org.apache.commons.validator.routines.EmailValidator;

/**
 *
 * @author Lenovo
 */
public class RegistrationController {

    private final static String DB_DRIVER_CLASS = "org.apache.derby.jdbc.ClientDriver";
    private final static String DB_URL = "jdbc:derby://localhost:1527/shelf";
    private final static String DB_USERNAME = "root";
    private final static String DB_PASSWORD = "shelf123@";
    UserBean user;

    public RegistrationController() {
    }

    public UserBean addUser(String firstName, String lastName, String emailID, String contactNumber, String password, ServletContext context) throws SQLException, ClassNotFoundException {
        Integer uid;
        ResultSet resultSet;
        String verificationKey = null;
        Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        Class.forName(DB_DRIVER_CLASS);
        context.setAttribute("connection", conn);
        try (final JdbcRowSet rowSet = new JdbcRowSetImpl(conn)) {
            rowSet.setType(RowSet.TYPE_SCROLL_SENSITIVE);
            rowSet.setConcurrency(RowSet.CONCUR_UPDATABLE);
            rowSet.setReadOnly(false);
//             Fills this RowSet object with data.
            context.setAttribute("connection", rowSet);
            rowSet.setCommand("");
            rowSet.execute();
            rowSet.absolute(1);
            uid = rowSet.getInt(1);

            System.out.println("UID: " + uid);
            uid = uid + 1;
            System.out.println("UID: " + uid);

            //Changed on 18-3-2018
            //Earlier: -
            //rowSet.setCommand("SELECT * FROM userdetails ");
            //After: -
            rowSet.setCommand("SELECT * FROM ROOT.userdetails ");
            rowSet.execute();
            //Added on 18-3-2018
            rowSet.absolute(1);
            verificationKey = UUID.randomUUID().toString();

            rowSet.moveToInsertRow();
            rowSet.updateString(1, firstName);  // Use column number
            rowSet.updateString(2, lastName);
            rowSet.updateString(3, emailID);
            rowSet.updateString(4, password);
            rowSet.updateLong(5, Long.parseLong(contactNumber));

            //Added on 18-3-2018
            rowSet.updateBoolean(6, false);
            rowSet.updateInt(7, uid);
            rowSet.updateString(8, verificationKey);
            rowSet.insertRow();
            user = new UserBean(uid, emailID, firstName, lastName, password, verificationKey);
            user.setIsValid(false);
//Commented on 18-3-2018            user.setEmailID(rowSet.getString("emailID"));
//            user.setFirstName(rowSet.getString("firstName"));
//            user.setLastName(rowSet.getString("lastName"));
//            user.setContactNumber(rowSet.getLong("contactNumber"));
//            user.setPassword(rowSet.getString("password"));
//            user.setIsValid(true);
            rowSet.beforeFirst();
        } catch (SQLException ex) {
            System.err.println("Error:" + ex.getMessage() + " " + ex.getNextException());
        }
        return user;
    }

    static boolean validateEmail(String emailID) {
        EmailValidator myvalidator = EmailValidator.getInstance();
        return myvalidator.isValid(emailID);
    }
}
