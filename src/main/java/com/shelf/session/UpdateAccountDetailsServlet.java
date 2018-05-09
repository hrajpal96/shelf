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
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class UpdateAccountDetailsServlet extends HttpServlet {

    UpdateAccountDetailsController update;

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
        String email = request.getParameter("emailID");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String phoneNumber = request.getParameter("phone_num");
        HttpSession session = request.getSession(true);
        UserBean user = (UserBean) session.getAttribute("user");
        update = new UpdateAccountDetailsController();
        user = update.updateUser(email, firstName, lastName, phoneNumber, user, this.getServletContext());
        if (user.isUpdated()) {
            session.setAttribute("isupdated", true);
            sendVerificationMail(user);
        } else {
            session.setAttribute("isupdated", false);
        }
        response.sendRedirect("account.jsp");
    }

    private void sendVerificationMail(UserBean aUser) throws IOException {
        String verificationMessage = verificationMessage = "http://localhost:8084/RecommenderApplication/verify.do?key="
                + aUser.getVerificationkey() + "&"
                + "uid=" + aUser.getUID();
        try {
            SendGrid sg = new SendGrid(System.getenv("SENDGRID_API_KEY"));
            Request req = new Request();
            req.setMethod(Method.POST);
            req.setEndpoint("mail/send");
            req.setBody("{\"personalizations\":[{\"to\":[{\"email\":\"" + aUser.getEmailID() + "\"}],\"subject\":\"Shelf: Change of Primary E-Mail Account\"}],\"from\":{\"email\":\"hrajpal96@gmail.com\"},\"content\":[{\"type\":\"text/plain\",\"value\": \"" + verificationMessage + "\"}]}");
            Response resp = sg.api(req);
        } catch (IOException e) {

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
