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
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author Lenovo
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({com.shelf.session.LoginServletIT.class, com.shelf.session.SessionListenerIT.class, com.shelf.session.UserBeanIT.class, com.shelf.session.LoginControllerIT.class, com.shelf.session.LogoutServletIT.class})
public class SessionITSuite {

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }
    
}
