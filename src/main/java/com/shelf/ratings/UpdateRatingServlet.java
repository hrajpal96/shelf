/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.ratings;

import com.shelf.notifications.NotificationService;
import com.shelf.notifications.UserNotificationBean;
import com.shelf.search.BookBean;
import com.shelf.session.UserBean;
import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.RowSet;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Lenovo
 */
public class UpdateRatingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        ConnectionBean conn = (ConnectionBean) request.getServletContext().getAttribute("db");
        System.out.println(conn);
        String rating = request.getParameter("stars");
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        String bookid = request.getParameter("bookid");
        try {
            /* TODO output your page here. You may use following sample code. */
            final JdbcRowSet rowset = new JdbcRowSetImpl(conn.getConnection());
            rowset.setType(RowSet.TYPE_SCROLL_SENSITIVE);
            rowset.setConcurrency(RowSet.CONCUR_UPDATABLE);
            rowset.setReadOnly(false);
            PrintWriter out = response.getWriter();
            rowset.setCommand("SELECT *  FROM taste_preferences where user_id='" + user.getUID() + "' and item_id='" + Long.parseLong(bookid) + "'");
            rowset.execute();
            if (rowset != null) {
                if (rowset.next()) {
                    System.out.println(rowset.getLong("user_id"));
                    rowset.absolute(1);
                    rowset.updateFloat("preference", Float.parseFloat(rating));
                    rowset.updateRow();
                    System.out.println("Successfully updated");
                } else {
                    rowset.absolute(1);
                    rowset.moveToInsertRow();
                    rowset.updateLong("user_id", user.getUID());
                    rowset.updateLong("item_id", Long.parseLong(bookid));
                    rowset.updateFloat("preference", Float.parseFloat(rating));
                    rowset.insertRow();
                    System.out.println("Successfully inserted");
                }

                //Generating User Notification upon rating a book
                HttpSession session = request.getSession();
                Timestamp timestamp = new Timestamp(new java.util.Date().getTime());
                UserNotificationBean notification = new UserNotificationBean();
                notification.setuserID(user.getUID());
                NotificationService notify = new NotificationService(getServletContext());
                BookBean bookdetails = (BookBean) session.getAttribute("bookdetails");
                System.out.println(bookdetails.getBookname());
                notification.setNotificationID(2);
                notification.setMessage("You rated a book: <a href=\"viewbook.do?bookid=" + rowset.getLong("item_id") + "\">" + bookdetails.getBookname() + "</a>" + " with a rating of " + rating + " stars");
                notification.setGeneration_time(timestamp);
                notification.setReadstatus(false);
                notify.addNotificationToDatabase(notification, timestamp);
                notify.addNotificationToBean(notification);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {

        }
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        RequestDispatcher rd = request.getRequestDispatcher("/viewbook.do?bookid=" + bookid);
        rd.forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(UpdateRatingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(UpdateRatingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
