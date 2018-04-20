package com.shelf.registration;

import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.JdbcRowSet;

/**
 *
 * @author Harsh
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
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        boolean isValid;
        Integer uid = new Integer(request.getParameter("uid"));
        String validationKey = request.getParameter("key");
        ServletContext context = getServletContext();
        ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
        try (final JdbcRowSet rowset = new JdbcRowSetImpl(conn.getConnection())) {
            rowset.setType(JdbcRowSet.TYPE_SCROLL_SENSITIVE);
            rowset.setConcurrency(JdbcRowSet.CONCUR_UPDATABLE);
            rowset.setReadOnly(false);
            rowset.setCommand("SELECT verification_key from user where uid=" + uid);
            rowset.execute();
            rowset.absolute(1);
            String key = rowset.getString(1);
            if (key.equalsIgnoreCase(validationKey)) {
                isValid = true;
                rowset.setCommand("SELECT * FROM user where uid=" + uid);
                rowset.execute();
                rowset.absolute(1);
                rowset.moveToCurrentRow();
                rowset.updateBoolean("isValid", isValid);
                rowset.updateRow();
                request.getRequestDispatcher("verified.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmailVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EmailVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
