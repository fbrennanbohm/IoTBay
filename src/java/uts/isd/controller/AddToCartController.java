/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.*;
import uts.isd.model.dao.*;

/**
 * This servlet loads the page.
 *
 * @author Patrick
 */
public class AddToCartController extends HttpServlet {

    private UserCartProductDAO userCartProductDAO;

    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            userCartProductDAO = new UserCartProductDAO(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int userId = Integer.parseInt(request.getParameter("userId")); // get userId from HTTP request parameter
        int productId = Integer.parseInt(request.getParameter("productId")); // get userId from HTTP request parameter
        int quantity = Integer.parseInt(request.getParameter("quantity")); // get quantity from HTTP request parameter

        boolean success = false;
        try {

            userCartProductDAO.createUserCartProduct(userId, productId, quantity);

            response.sendRedirect("/IoTBay/ProductListController");
            success = true;
        } catch (SQLException ex) {
            Logger.getLogger(AddToCartController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!success) {
            request.getRequestDispatcher("catalogue.jsp").include(request, response);
        }
    }
}
