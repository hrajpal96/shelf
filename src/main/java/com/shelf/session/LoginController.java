/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Lenovo
 */
class LoginController {

    UserBean user = new UserBean();

    public UserBean authenticate(String emailID, String password, ServletContext context) throws ClassNotFoundException {
        try {

            ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
            final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
//            rowSet.setReadOnly(true);
            System.out.println("Login "+ emailID);
            rowSet.setCommand("SELECT * FROM user where emailID = '" + emailID + "'");
            rowSet.execute();
            if (rowSet.first()) {
                System.out.println("executed query");
                if (password.equals(rowSet.getString("password"))) {
                    System.out.println("Success");
                    user.setUID(rowSet.getInt("uid"));
                    user.setEmailID(rowSet.getString("emailID"));
                    user.setFirstName(rowSet.getString("firstName"));
                    user.setLastName(rowSet.getString("lastName"));
                    user.setContactNumber(rowSet.getLong("contactNumber"));
                    user.setIsValid(rowSet.getBoolean("isValid"));
                    user.setDoesexist(true);
                }
                else{
                    user.setIsValid(false);
                    System.out.println("Is the user valid? "+user.isIsValid());
                }
            }
        } catch (SQLException ex) {
            System.err.println("Error:" + ex.getMessage());
        }

//        session.setAttribute("user", rowSet);
        return user;
    }
}
