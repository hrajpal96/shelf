/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectionproperties;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 *
 * @author Lenovo
 */
@WebListener
public class ConnectionPropertiesListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ServletContext sc = sce.getServletContext();
        String url = sc.getInitParameter("DB_URL");
        String user_name = sc.getInitParameter("DB_USERNAME");
        String password = sc.getInitParameter("DB_PASSWORD");
        String database = sc.getInitParameter("DB_DATABASE");
        ConnectionBean conn = null;
        try {
            conn = new ConnectionBean(url + database, user_name, password);
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ConnectionPropertiesListener.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("in the listener!!");
        sc.setAttribute("db", conn);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("*************Context has been destroyed**********");
    }

}
