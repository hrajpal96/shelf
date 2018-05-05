/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Lenovo
 */
public class UserBeanIT {
    
    public UserBeanIT() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of setDoesexist method, of class UserBean.
     */
    @Test
    public void testSetDoesexist() {
        System.out.println("setDoesexist");
        boolean doesexist = false;
        UserBean instance = new UserBean();
        instance.setDoesexist(doesexist);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of isDoesexist method, of class UserBean.
     */
    @Test
    public void testIsDoesexist() {
        System.out.println("isDoesexist");
        UserBean instance = new UserBean();
        boolean expResult = false;
        boolean result = instance.isDoesexist();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUID method, of class UserBean.
     */
    @Test
    public void testGetUID() {
        System.out.println("getUID");
        UserBean instance = new UserBean();
        Integer expResult = null;
        Integer result = instance.getUID();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setUID method, of class UserBean.
     */
    @Test
    public void testSetUID() {
        System.out.println("setUID");
        Integer UID = null;
        UserBean instance = new UserBean();
        instance.setUID(UID);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getVERIFICATIONKEY method, of class UserBean.
     */
    @Test
    public void testGetVERIFICATIONKEY() {
        System.out.println("getVERIFICATIONKEY");
        UserBean instance = new UserBean();
        String expResult = "";
        String result = instance.getVERIFICATIONKEY();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getEmailID method, of class UserBean.
     */
    @Test
    public void testGetEmailID() {
        System.out.println("getEmailID");
        UserBean instance = new UserBean();
        String expResult = "";
        String result = instance.getEmailID();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setEmailID method, of class UserBean.
     */
    @Test
    public void testSetEmailID() {
        System.out.println("setEmailID");
        String emailID = "";
        UserBean instance = new UserBean();
        instance.setEmailID(emailID);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserName method, of class UserBean.
     */
    @Test
    public void testGetUserName() {
        System.out.println("getUserName");
        UserBean instance = new UserBean();
        String expResult = "";
        String result = instance.getUserName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setUserName method, of class UserBean.
     */
    @Test
    public void testSetUserName() {
        System.out.println("setUserName");
        String userName = "";
        UserBean instance = new UserBean();
        instance.setUserName(userName);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFirstName method, of class UserBean.
     */
    @Test
    public void testGetFirstName() {
        System.out.println("getFirstName");
        UserBean instance = new UserBean();
        String expResult = "";
        String result = instance.getFirstName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setFirstName method, of class UserBean.
     */
    @Test
    public void testSetFirstName() {
        System.out.println("setFirstName");
        String firstName = "";
        UserBean instance = new UserBean();
        instance.setFirstName(firstName);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getLastName method, of class UserBean.
     */
    @Test
    public void testGetLastName() {
        System.out.println("getLastName");
        UserBean instance = new UserBean();
        String expResult = "";
        String result = instance.getLastName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setLastName method, of class UserBean.
     */
    @Test
    public void testSetLastName() {
        System.out.println("setLastName");
        String lastName = "";
        UserBean instance = new UserBean();
        instance.setLastName(lastName);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getContactNumber method, of class UserBean.
     */
    @Test
    public void testGetContactNumber() {
        System.out.println("getContactNumber");
        UserBean instance = new UserBean();
        long expResult = 0L;
        long result = instance.getContactNumber();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setContactNumber method, of class UserBean.
     */
    @Test
    public void testSetContactNumber() {
        System.out.println("setContactNumber");
        long contactNumber = 0L;
        UserBean instance = new UserBean();
        instance.setContactNumber(contactNumber);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPassword method, of class UserBean.
     */
    @Test
    public void testGetPassword() {
        System.out.println("getPassword");
        UserBean instance = new UserBean();
        String expResult = "";
        String result = instance.getPassword();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setPassword method, of class UserBean.
     */
    @Test
    public void testSetPassword() {
        System.out.println("setPassword");
        String password = "";
        UserBean instance = new UserBean();
        instance.setPassword(password);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of isIsValid method, of class UserBean.
     */
    @Test
    public void testIsIsValid() {
        System.out.println("isIsValid");
        UserBean instance = new UserBean();
        boolean expResult = false;
        boolean result = instance.isIsValid();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setIsValid method, of class UserBean.
     */
    @Test
    public void testSetIsValid() {
        System.out.println("setIsValid");
        boolean isValid = false;
        UserBean instance = new UserBean();
        instance.setIsValid(isValid);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
