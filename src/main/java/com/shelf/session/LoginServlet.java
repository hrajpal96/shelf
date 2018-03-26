/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import com.shelf.recommender.RecommendationGenerator;
import java.io.IOException;
import java.sql.SQLException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Harsh
 */
public class LoginServlet extends HttpServlet {

    private ScheduledExecutorService scheduler;
    private @Resource(name = "jdbc/taste_preferences",
            lookup = "jdbc/taste_preferences",
            authenticationType = Resource.AuthenticationType.APPLICATION,
            shareable = false)
    DataSource tasteDS;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String emailID = request.getParameter("emailID");
        String password = request.getParameter("password");
        LoginController logincontroller = new LoginController();
        UserBean user = logincontroller.authenticate(emailID, password, this.getServletContext());
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        if (user.isIsValid()) {
//            request.getRequestDispatcher("/recommendations.do").forward(request, response);
            scheduler = Executors.newScheduledThreadPool(20);
            session.setAttribute("uid", user.getUID());
            scheduler.schedule(new RecommendationGenerator(session, tasteDS), 2, TimeUnit.SECONDS);
            scheduler.shutdown();
            String url = response.encodeRedirectURL("success.jsp");
            response.sendRedirect(url);
            response.setHeader("Refresh","2");
//            dispatcher. forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
