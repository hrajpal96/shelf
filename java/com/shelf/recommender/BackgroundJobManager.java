/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.recommender;

import com.shelf.session.UserBean;
import java.util.concurrent.ScheduledExecutorService;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.sql.DataSource;

/**
 *
 * @author Lenovo
 */
public class BackgroundJobManager implements HttpSessionListener {

    private ScheduledExecutorService scheduler;
    private @Resource(name = "jdbc/taste_preferences",
            lookup = "jdbc/taste_preferences",
            authenticationType = Resource.AuthenticationType.APPLICATION,
            shareable = false)
    DataSource tasteDS;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Session has been created");
        UserBean user = (UserBean) se.getSession().getAttribute("user");
        System.out.println("User session has been initialized");
        se.getSession().setAttribute("uid", 2);
        System.out.println("User is not null in backgroundjobmanager");
//
//        scheduler = Executors.newScheduledThreadPool(10);
//        scheduler.schedule(new RecommendationGenerator(se.getSession(),tasteDS), 0, TimeUnit.SECONDS);

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        session.setAttribute("continue", false);
//        scheduler.shutdownNow();
//        try {
//            scheduler.awaitTermination(0, TimeUnit.HOURS);
//        } catch (InterruptedException ex) {
//            Logger.getLogger(BackgroundJobManager.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
}
