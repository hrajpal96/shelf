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

    public UserBean addUser(String firstName, String lastName, String emailID, String contactNumber, String[] preferenceIDs, String password, ServletContext context) throws SQLException, ClassNotFoundException {
        Integer uid;
        String verificationKey = null;
        ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
        System.out.println("Connection : " + conn.getConnection());
        try {
            final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
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
            rowSet.updateInt("uid", uid);  // Use column number
            rowSet.updateInt("typeID", 2);
            rowSet.updateString("firstName", firstName);
            rowSet.updateString("lastName", lastName);
            rowSet.updateString("emailID", emailID);
            rowSet.updateString("password", password);
            //Added on 18-3-2018
            rowSet.updateLong("contactNumber", Long.parseLong(contactNumber));
            rowSet.updateBoolean("isValid", false);
            rowSet.updateString("verification_key", verificationKey);
            rowSet.insertRow();
            rowSet.setType(RowSet.TYPE_SCROLL_SENSITIVE);
            rowSet.setConcurrency(RowSet.CONCUR_UPDATABLE);

            rowSet.setCommand("SELECT *FROM userpreferences");
            rowSet.execute();
            rowSet.absolute(1);
            for (String preference : preferenceIDs) {
                rowSet.moveToInsertRow();
                rowSet.updateInt(2, uid);
                rowSet.updateInt(3, Integer.parseInt(preference));
                rowSet.insertRow();
                System.out.println("RowSet Inserted");
            }
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
