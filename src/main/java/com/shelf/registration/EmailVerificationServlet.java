/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.registration;

import com.sun.rowset.JdbcRowSetImpl;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Lenovo
 */
public class EmailVerificationServlet extends HttpServlet {

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
        boolean isValid = false;
        Integer uid = new Integer(request.getParameter("uid"));
        String validationKey = request.getParameter("key");
        ServletContext context = getServletContext();
        String query;
        Connection conn = (Connection) context.getAttribute("connection");
        try (JdbcRowSet rowset = new JdbcRowSetImpl(conn)) {
            System.out.println("Inside try catch block");
            rowset.setType(rowset.TYPE_SCROLL_SENSITIVE);
            rowset.setConcurrency(rowset.CONCUR_UPDATABLE);
            rowset.setReadOnly(false);
            rowset.setCommand("select VERIFICATION_KEY from ROOT.userdetails where UID=" + uid);
            rowset.execute();
            System.out.println("Query Executed");
            rowset.absolute(1);
            String key = rowset.getString(1);
            System.out.println("getString executed");
            if (key.equalsIgnoreCase(validationKey)) {
                System.out.println("Inside IF");
                isValid = true;
                rowset.setCommand("select *FROM ROOT.userdetails where UID=" + uid);
                rowset.execute();
                rowset.absolute(1);
                rowset.moveToCurrentRow();
                rowset.updateBoolean("isValid", isValid);
                rowset.updateRow();
                System.out.println("Executed Query");
                response.setHeader("Refresh", "0;url=" + "verified.jsp");
            }

        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
