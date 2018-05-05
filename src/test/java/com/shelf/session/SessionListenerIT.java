/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import javax.servlet.http.HttpSessionEvent;
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
public class SessionListenerIT {
    
    public SessionListenerIT() {
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
     * Test of sessionCreated method, of class SessionListener.
     */
    @Test
    public void testSessionCreated() {
        System.out.println("sessionCreated");
        HttpSessionEvent se = null;
        SessionListener instance = new SessionListener();
        instance.sessionCreated(se);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of sessionDestroyed method, of class SessionListener.
     */
    @Test
    public void testSessionDestroyed() {
        System.out.println("sessionDestroyed");
        HttpSessionEvent se = null;
        SessionListener instance = new SessionListener();
        instance.sessionDestroyed(se);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
