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

public class RemovePaymentMethod extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        int paymentId = Integer.parseInt(request.getParameter("RemovePaymentID"));
        UserDAO userDAO = (UserDAO) session.getAttribute("userDAO");

        try {

            userDAO.deletePayment(paymentId);
            request.setAttribute("successMsg", "Successfully removed payment");
            request.getRequestDispatcher("deletePaymentMethod.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("deletePaymentMethod.jsp").forward(request, response);
    }
}
