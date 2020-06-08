/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoField;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.*;
import uts.isd.model.dao.*;
import java.util.List;

/**
 * This servlet loads the order history page.
 *
 * @author Patrick
 */
public class CheckoutController extends HttpServlet {

    private UserCartProductDAO userCartProductDAO;
    private OrderDAO orderDAO;

    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            userCartProductDAO = new UserCartProductDAO(conn);
            orderDAO = new OrderDAO(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int userId = Integer.parseInt(request.getParameter("id")); // get userId from HTTP request parameter

        try {
            List<UserCartProduct> userCartProductList = userCartProductDAO.getUserCartProductList(userId);
            request.setAttribute("userCartProductList", userCartProductList);
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int userId = Integer.parseInt(request.getParameter("id")); // get userId from HTTP request parameter

        boolean success = false;
        try {
            List<UserCartProduct> userCartProductList = userCartProductDAO.getUserCartProductList(userId);

            orderDAO.createOrder(userId, null, Date.valueOf(LocalDate.now()), "Unpaid");

            List<Order> orderList = orderDAO.getUserOrderList(userId);
            Order order = orderList.get(orderList.size() - 1);

            String orderNumber = "";
            for (int i = 0; i < Math.max(5 - Integer.toString(order.getOrderId()).length(), 0); i++) {
                orderNumber += "0";
            }
            orderNumber += Integer.toString(order.getOrderId());
            order.setOrderNumber(orderNumber);

            orderDAO.updateOrder(order);

            for (UserCartProduct userCartProduct : userCartProductList) {
                orderDAO.createOrderItem(order.getOrderId(), userCartProduct.getProductId(), userCartProduct.getQuantity(), userCartProduct.getProduct().getPrice());
            }

            userCartProductDAO.deleteUserCartProducts(userId);

            orderDAO.updateOrder(order);

            response.sendRedirect("/IoTBay/PayOrder?id=" + order.getOrderId());
            success = true;
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!success) {
            request.getRequestDispatcher("checkout.jsp").include(request, response);
        }
    }
}
