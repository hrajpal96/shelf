/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import java.io.Serializable;

/**
 *
 * @author Lenovo
 */
public class UserBean implements Serializable {

    //Added UID on 18-3-2018
    private Integer UID;
    private String emailID;
    private String userName;
    private String firstName;
    private String lastName;
    private long contactNumber;
    private String password;
    private final String VERIFICATIONKEY;

    public Integer getUID() {
        return UID;
    }

    public void setUID(Integer UID) {
        this.UID = UID;
    }

    //Ctors added on 18-3-2018
    public UserBean() {
        this.VERIFICATIONKEY = null;
    }

    public UserBean(Integer UID, String emailID, String firstName, String lastName, String password, String verificationKey) {
        this.UID = UID;
        this.emailID = emailID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.VERIFICATIONKEY = verificationKey;
    }

    /*public UserBean() {
    }*/
    public String getVERIFICATIONKEY() {
        return VERIFICATIONKEY;
    }

    private boolean isValid = false;

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public long getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(long contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsValid() {
        return isValid;
    }

    public void setIsValid(boolean isValid) {
        this.isValid = isValid;
    }

}
