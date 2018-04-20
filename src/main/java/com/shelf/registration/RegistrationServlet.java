package com.shelf.registration;

//import com.sendgrid.Method;
//import com.sendgrid.Request;
//import com.sendgrid.Response;
//import com.sendgrid.SendGrid;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import static com.shelf.registration.RegistrationController.validateEmail;
import com.shelf.session.UserBean;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Harsh
 */
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String emailID = request.getParameter("emailID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String contactNumber = request.getParameter("contactNumber");
        RegistrationController controller = new RegistrationController();
        System.out.println(emailID);
        if (validateEmail(emailID)) {
            UserBean user = controller.addUser(firstName, lastName, emailID, contactNumber, password, this.getServletContext());
            if (!(user == null)) {
                sendVerificationMail(user);
                request.setAttribute("isregistered", true);
                request.getRequestDispatcher("registered.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Please enter valid details");
                response.setHeader("Refresh", "1");
            }
        }
    }

    /**
     *
     * @param aUser UserBean
     */
    private void sendVerificationMail(UserBean aUser) throws IOException {
//        Properties mailServerProperties;
//        Session getMailSession;
//        MimeMessage generateMailMessage;
//        Transport transport = null;
        String verificationMessage;
        // Step1
        // System.out.println("\n 1st ===> setup Mail Server Properties..");
//            mailServerProperties = System.getProperties();
//            mailServerProperties.put("mail.smtp.port", "587");
//            mailServerProperties.put("mail.smtp.auth", "true");
//            mailServerProperties.put("mail.smtp.starttls.enable", "true");
//            System.out.println("Mail Server Properties have been setup successfully..");

// Step2
// System.out.println("\n\n 2nd ===> get Mail Session..");
//            getMailSession = Session.getDefaultInstance(mailServerProperties, null);
//            generateMailMessage = new MimeMessage(getMailSession);
//            System.out.println(aUser.getEmailID());
//            generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(aUser.getEmailID()));
//            //   generateMailMessage.addRecipient(Message.RecipientTmaype.CC, new InternetAddress(emailTo));
//            generateMailMessage.setSubject("Verification mail from Shelf");
        verificationMessage = "http://localhost:8084/RecommenderApplication/verify.do?key="
                + aUser.getVERIFICATIONKEY() + "&"
                + "uid=" + aUser.getUID();
//            String emailBody = verificationMessage;
//            generateMailMessage.setContent(emailBody, "text/html");
//            System.out.println("Mail Session has been created successfully..");
// Step3
//            System.out.println("\n\n 3rd ===> Get Session and Send mail");
//            transport = getMailSession.getTransport("smtps");
// Enter your correct gmail UserID and Password
// if you have 2FA enabled then provide App Specific Password
//            transport.connect("smtp.gmail.com", "yourid", "yourpass");
//            transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
//            transport.close();
//            transport = null;
        try {
            SendGrid sg = new SendGrid(System.getenv("SENDGRID_API_KEY"));
            Request req = new Request();
            req.setMethod(Method.POST);
            req.setEndpoint("mail/send");
            req.setBody("{\"personalizations\":[{\"to\":[{\"email\":\"" + aUser.getEmailID() + "\"}],\"subject\":\"Account Verification link from Shelf\"}],\"from\":{\"email\":\"hrajpal96@gmail.com\"},\"content\":[{\"type\":\"text/plain\",\"value\": \"" + verificationMessage + "\"}]}");
            Response resp = sg.api(req);
        } catch (IOException e) {

        }
//try {
//    if (transport != null) {
//        transport.close();
//    }
//} catch (MessagingException ex) {
//}
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
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
