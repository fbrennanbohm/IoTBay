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
  //int userId = session.req
  int userId = Integer.parseInt(request.getParameter("Id"));
  String paymentType = request.getParameter("paymentType");
  String cardNumber = request.getParameter("cardNumber");
  String cardHolder = request.getParameter("cardHolder");
  String expiryDate = request.getParameter("expiryDate");
  String cvc = request.getParameter("cvc");
  UserDAO userDAO = (UserDAO)session.getAttribute("userDAO"); 
  //PaymentMethodDAO paymentMethodDAO = (PaymentMethodDAO)session.getAttribute("userDAO");
  //validator.clear(session);

 
  if(!validator.validatePaymentType(paymentType)) {
    request.setAttribute("errorMsg", "Payment type must be Visa/Mastercard");
    request.getRequestDispatcher("addPayment.jsp").forward(request, response);
}   else if (!validator.validateCardNumber(cardNumber)) {
    request.setAttribute("errorMsg", "Card number must be 15-16 digits long");
    request.getRequestDispatcher("addPayment.jsp").forward(request, response);
}  else if (!validator.validateCardHolder(cardHolder)) {
    request.setAttribute("errorMsg", "Must enter first name of card holder");
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
} else if (!validator.validateExpiryDate(expiryDate)) {
    request.setAttribute("errorMsg", "Expiry Date must be MM/YY");;
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
} else if (!validator.validateCvc(cvc)) {
    request.setAttribute("errorMsg", "CVC must be 3 digits long");
    request.getRequestDispatcher("addPayment.jsp").include(request,response);
  }
else{
            try {
                userDAO.addPayment(userId, paymentType, cardNumber, cardHolder, expiryDate, cvc);
                request.setAttribute("successMsg", "Successfully Added new payment");
                request.getRequestDispatcher("addPayment.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
        request.getRequestDispatcher("addPayment.jsp").forward(request, response);
        }
}
}
    