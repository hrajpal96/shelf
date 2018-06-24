/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.session;

import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ChangePasswordServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String newPassword = request.getParameter("newpassword");
            String currentPassword = request.getParameter("password");
            UserBean user = (UserBean) session.getAttribute("user");
            ConnectionBean conn = (ConnectionBean) this.getServletContext().getAttribute("db");
            JdbcRowSet rowset = new JdbcRowSetImpl(conn.getConnection());
            rowset.setCommand("SELECT  * FROM `user` WHERE uid = " + user.getUID());
            rowset.execute();
            rowset.first();
            System.out.println(rowset.getString("firstName"));
            if (newPassword != null) {
                System.out.println("Current: " + currentPassword + "\n");
                System.out.println(user.getPassword());
                if (!(newPassword.equals(user.getPassword())) && currentPassword.equals(user.getPassword())) {
                    rowset.updateString("password", newPassword);
                }
                rowset.updateRow();
                rowset.absolute(-1);
                user.setPassword(newPassword);
                session.setAttribute("passchanged", true);
                sendVerificationMail(user);
                request.getRequestDispatcher("account.jsp").forward(request, response);
            } else {
                System.out.println("Empty new password");
            }
        } catch (SQLException e) {
            log(e.getMessage());
        }

    }
    private void sendVerificationMail(UserBean aUser) throws IOException {

        String verificationMessage;
        verificationMessage = "http://localhost:8084/RecommenderApplication/verify.do?key="
                + aUser.getVerificationkey()+ "&"
                + "uid=" + aUser.getUID();
        try {
            SendGrid sg = new SendGrid(System.getenv("SENDGRID_API_KEY"));
            Request req = new Request();
            req.setMethod(Method.POST);
            req.setEndpoint("mail/send");
            req.setBody("{\"personalizations\":[{\"to\":[{\"email\":\"" + aUser.getEmailID() + "\"}],\"subject\":\"Password changed\"}],\"from\":{\"email\":\"hrajpal96@gmail.com\"},\"content\":[{\"type\":\"text/plain\",\"value\": \"Hey, "+aUser.getFirstName()+"\n Your Password has been changed successfully.\"}]}");
            Response resp = sg.api(req);
        } catch (IOException e) {

        }
    }
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
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
