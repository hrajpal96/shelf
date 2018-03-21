/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import com.sun.rowset.JdbcRowSetImpl;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Lenovo
 */
class LoginController {

    private static JdbcRowSet rowSet = null;
    UserBean user = new UserBean();
    private final static String DB_DRIVER_CLASS = "org.apache.derby.jdbc.ClientDriver";
    private final static String DB_URL = "jdbc:derby://localhost:1527/shelf";
    private final static String DB_USERNAME = "root";
    private final static String DB_PASSWORD = "shelf123@";

    public UserBean authenticate(ServletContext context, String emailID, String password) throws ClassNotFoundException {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            Class.forName(DB_DRIVER_CLASS);
            rowSet = new JdbcRowSetImpl(conn);
            rowSet.setCommand("SELECT * from ROOT.userdetails where emailID = '" + emailID + "'");
            rowSet.setReadOnly(true);
            rowSet.execute();
            if (rowSet.first()) {
                System.out.println("executed query");
                if (password.equals(rowSet.getString("password"))) {
                    System.out.println("Success");
                    user.setEmailID(rowSet.getString("emailID"));
                    user.setFirstName(rowSet.getString("firstName"));
                    user.setLastName(rowSet.getString("lastName"));
                    user.setIsValid(true);
                }
            }
        } catch (SQLException ex) {
            System.err.println("Error:" + ex.getMessage());
        } finally {
            try {
                rowSet.close();
            } catch (SQLException ex) {
                System.err.println("Error:" + ex.getMessage());
            }
        }
        return user;
    }
}
