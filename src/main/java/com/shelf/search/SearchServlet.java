/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.search;

import com.sun.rowset.JdbcRowSetImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.RowSet;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Lenovo
 */
public class SearchServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String query = request.getParameter("search");
        String encodedsearch = URLEncoder.encode(query, "US-ASCII");
        String numberofresults = request.getParameter("numberofresults");
        ServletContext context = request.getServletContext();
        Connection conn = (Connection) this.getServletContext().getAttribute("connection");
        context.setAttribute("connection", conn);
        try (JdbcRowSet rowSet = new JdbcRowSetImpl(conn)) {
            
            rowSet.setType(RowSet.TYPE_SCROLL_SENSITIVE);
            rowSet.setConcurrency(RowSet.CONCUR_UPDATABLE);
            rowSet.setReadOnly(false);
            
//             Fills this RowSet object with data.

            context.setAttribute("connection", rowSet);
            rowSet.setCommand("SELECT bookID from book where bookName like '"+query+"' ");
            rowSet.execute();
            rowSet.absolute(1);
            context.setAttribute("searchResult", rowSet);
            
            if(rowSet.getInt(1) > 0)
            {
                RequestDispatcher rd =request.getRequestDispatcher("searchResult.jsp");
                rd.forward(request, response);   
            }
            else
            {
                RequestDispatcher rd =request.getRequestDispatcher("searchResult.jsp");
                rd.forward(request, response);
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
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
