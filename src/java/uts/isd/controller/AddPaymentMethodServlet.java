/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;


import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;

import uts.isd.model.User;
import uts.isd.model.dao.PaymentMethodDAO;

import uts.isd.model.dao.UserDAO;

public class AddPaymentMethodServlet extends HttpServlet {
   

     @Override   

     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

  HttpSession session = request.getSession();
  Validator validator = new Validator();
  String paymentType = request.getParameter("paymentType");
  String cardNumber = request.getParameter("cardNumber");
  String cardHolder = request.getParameter("cardHolder");
  String expiryDate = request.getParameter("expiryDate");
  String cvc = request.getParameter("cvc");
  UserDAO userDAO = (UserDAO)session.getAttribute("userDAO"); 
  PaymentMethodDAO paymentMethodDAO = (PaymentMethodDAO)session.getAttribute("userDAO");
  validator.clear(session);

 
  if(!validator.validatePaymentType(paymentType)) {
    session.setAttribute("nameErr","Error: Payment Type format incorrect");
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
}   else if (!validator.validateCardNumber(cardNumber)) {
    session.setAttribute("nameErr","Error: Card Number incorrect");
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
}  else if (!validator.validateCardHolder(cardHolder)) {
    session.setAttribute("emailErr","Error: Card Holder format incorrect");
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
} else if (!validator.validateExpiryDate(expiryDate)) {
    session.setAttribute("passErr","Error: Expiry Date format incorrect");
} else if (!validator.validateCvc(cvc)) {
    session.setAttribute("passErr","Error: CVC format incorrect");
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
}
else{
    try{
        Payment exist = paymentMethodDAO.findPayment(cardNumber);
            if(exist!=null) {
                session.setAttribute("existErr","Payment already exists");
                request.getRequestDispatcher("addPayment.jsp").include(request,response);
            } else {
                
               userDAO.addPayment(3,paymentType,cardNumber,cardHolder,expiryDate, cvc);                
                request.getRequestDispatcher("addPayment.jsp").include(request, response);
            }
            }
    catch (SQLException ex){
         Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE,null,ex);
    }
}
     }
}           
           
                    