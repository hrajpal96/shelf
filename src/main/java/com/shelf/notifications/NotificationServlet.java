/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.notifications;

import com.shelf.session.UserBean;
import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Lenovo
 */
public class NotificationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            ConnectionBean conn = (ConnectionBean) getServletContext().getAttribute("db");
            final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
            HttpSession session = request.getSession();
            UserBean user = (UserBean) (session.getAttribute("user"));
            rowSet.setCommand("SELECT COUNT(notification_id) from usernotifications where uid='" + user.getUID() + "' AND readstatus='false'");
            rowSet.execute();
            rowSet.absolute(1);
            if (rowSet != null) {
                System.out.println("RowSet is not empty");
                out.print(rowSet.getInt(1));
            } else {
                System.out.println("RowSet is Empty");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
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
            PrintWriter out = response.getWriter();
            ConnectionBean conn = (ConnectionBean) getServletContext().getAttribute("db");
            final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
            HttpSession session = request.getSession();
            UserBean user = (UserBean) (session.getAttribute("user"));
            rowSet.setCommand("SELECT COUNT(notification_id) from usernotifications where uid='" + user.getUID() + "' AND readstatus='false'");
            rowSet.execute();
            rowSet.absolute(1);
            if (rowSet != null) {
                System.out.println("RowSet is not empty");
                
                response.getWriter().write(rowSet.getInt(1));
            } else {
                System.out.println("RowSet is Empty");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
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
            PrintWriter out = response.getWriter();
            ConnectionBean conn = (ConnectionBean) getServletContext().getAttribute("db");
            final JdbcRowSet rowSet = new JdbcRowSetImpl(conn.getConnection());
            HttpSession session = request.getSession();
            UserBean user = (UserBean) (session.getAttribute("user"));
            rowSet.setCommand("SELECT COUNT(notification_id) from usernotifications where uid='" + user.getUID() + "' AND readstatus='false'");
            rowSet.execute();
            rowSet.absolute(1);
            if (rowSet != null) {
                System.out.println("RowSet is not empty");
                response.getWriter().write(rowSet.getInt(1));
            } else {
                System.out.println("RowSet is Empty");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
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
