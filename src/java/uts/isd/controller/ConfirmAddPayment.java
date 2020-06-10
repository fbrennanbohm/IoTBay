/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

     import java.sql.SQLException;
     import java.util.logging.Level;
     import java.util.logging.Logger;
     import javax.servlet.ServletException;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;
     import javax.servlet.http.HttpSession;
     import uts.isd.model.User;
     import uts.isd.model.dao.UserDAO;
     import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import uts.isd.model.PaymentMethod;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrderDAO;

/**
 *
 * @author Jack
 */
public class ConfirmAddPayment extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            userDAO = new UserDAO(conn);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     @Override   
     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
         
         response.setContentType("text/html;charset=UTF-8");
         HttpSession session = request.getSession();
         String paymentType = request.getParameter("paymentType");
         String cardNumber = request.getParameter("cardNumber");
         String cardHolder = request.getParameter("cardHolder");
         String cvc = request.getParameter("cvc");
         int userId = Integer.parseInt(request.getParameter("id"));
         int paymentId = Integer.parseInt(request.getParameter("paymentId"));
             
         try{
             User user = null;
             //PaymentMethod payment = userDAO.findPayment(paymentId);
             if(user == null) {
                 //user.setAddress(address);
                 //session.setAttribute("user", user);
                 //userDAO.updateShipping(userId, address);
                 //System.out.println(user.getAddress());
                 //session.setAttribute("updated","Update was successful");
                 //request.getRequestDispatcher("shipping.jsp").include(request,response);
                 
                 userDAO.updatePayment(paymentId, paymentType, cardNumber, cardHolder, cvc);
                 session.setAttribute("successMsg","Update was successful");
                 PaymentMethod newPayment = userDAO.findPayment(paymentId);
                 request.setAttribute("payment", newPayment);
             }          
             else {
                     session.setAttribute("errorMsg","Update was not successful");
             }
             }
         catch (SQLException | NullPointerException ex){
             Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
         }
         response.sendRedirect("main.jsp");
}
}
