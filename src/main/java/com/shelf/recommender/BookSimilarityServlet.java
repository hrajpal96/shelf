/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.recommender;

import com.shelf.search.BookBean;
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.apache.mahout.cf.taste.common.TasteException;

/**
 *
 * @author Lenovo
 */
@WebServlet(asyncSupported = true)
public class BookSimilarityServlet extends HttpServlet {

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
     * @throws org.apache.mahout.cf.taste.common.TasteException
     * @throws java.lang.InterruptedException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, TasteException, InterruptedException {

        if (request.getAttribute("bookdetails") != null) {
            BookBean bookdetails = (BookBean) request.getAttribute("bookdetails");
            HttpSession session = request.getSession(true);
            scheduler = Executors.newScheduledThreadPool(20);
            session.setAttribute("bookid", bookdetails.getBookID());
            System.out.println("Created Item Similarity Scheduler");
            scheduler.schedule(new SimilarBookRecommenderService(session, tasteDS), 0, TimeUnit.SECONDS);
            System.out.println("Scheduled Recommendation Task");
            String url = response.encodeRedirectURL("productdetails.jsp");
            scheduler.shutdown();
            scheduler.awaitTermination(0, TimeUnit.HOURS);
            request.getRequestDispatcher("productdetails.jsp").forward(request, response);
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
        } catch (TasteException ex) {
            Logger.getLogger(BookSimilarityServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(BookSimilarityServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (TasteException ex) {
            Logger.getLogger(BookSimilarityServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(BookSimilarityServlet.class.getName()).log(Level.SEVERE, null, ex);
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
