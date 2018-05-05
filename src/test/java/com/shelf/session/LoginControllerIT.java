/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import javax.servlet.ServletContext;
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
public class LoginControllerIT {
    
    public LoginControllerIT() {
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
     * Test of authenticate method, of class LoginController.
     */
    @Test
    public void testAuthenticate() throws Exception {
        System.out.println("authenticate");
        String emailID = "";
        String password = "";
        ServletContext context = null;
        LoginController instance = new LoginController();
        UserBean expResult = null;
        UserBean result = instance.authenticate(emailID, password, context);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
