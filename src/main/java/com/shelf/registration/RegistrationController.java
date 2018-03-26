package com.shelf.registration;

import com.shelf.session.UserBean;
import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.sql.RowSet;
import javax.sql.rowset.JdbcRowSet;
import org.apache.commons.validator.routines.EmailValidator;

/**
 *
 * @author Harsh
 */
public class RegistrationController {

    UserBean user;

    public RegistrationController() {
    }

    public UserBean addUser(String firstName, String lastName, String emailID, String contactNumber, String password, ServletContext context) throws SQLException, ClassNotFoundException {
        Integer uid;
        String verificationKey = null;
        ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
        System.out.println("Connection : "+conn.getConnection());
        try (final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection())) {
            rowSet.setType(RowSet.TYPE_SCROLL_SENSITIVE);
            rowSet.setConcurrency(RowSet.CONCUR_UPDATABLE);
            rowSet.setReadOnly(false);
            rowSet.setCommand("SELECT MAX(uid) FROM user");
            rowSet.execute();
            rowSet.absolute(1);
            //Fills this RowSet object with data.
            uid = rowSet.getInt(1);

            System.out.println("UID: " + uid);
            uid = uid + 1;
            System.out.println("UID: " + uid);

            //Changed on 18-3-2018
            //Earlier: -
            //rowSet.setCommand("SELECT * FROM userdetails ");
            //After: -
            rowSet.setCommand("SELECT * FROM user");
            rowSet.execute();
            //Added on 18-3-2018
            rowSet.absolute(1);
            verificationKey = UUID.randomUUID().toString();

            rowSet.moveToInsertRow();
            rowSet.updateInt(1, uid);  // Use column number
            rowSet.updateString(2, firstName);
            rowSet.updateString(3, lastName);
            rowSet.updateString(4, emailID);
            rowSet.updateString(5, password);
            //Added on 18-3-2018
            rowSet.updateLong(6, Long.parseLong(contactNumber));
            rowSet.updateBoolean(7, false);
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
