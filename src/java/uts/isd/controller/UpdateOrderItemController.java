/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.OrderItem;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrderDAO;

/**
 * This servlet loads the order history page.
 *
 * @author Patrick
 */
public class UpdateOrderItemController extends HttpServlet {

    private OrderDAO orderDAO;

    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            orderDAO = new OrderDAO(conn);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int orderItemId = Integer.parseInt(request.getParameter("id")); // get userId from HTTP request parameter

        try {
            OrderItem orderItem = orderDAO.getOrderItem(orderItemId);
            request.setAttribute("orderItem", orderItem);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateOrderItemController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("updateOrderItem.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        boolean success = false;
        try {

            OrderItem orderItem = orderDAO.getOrderItem(orderItemId);
            if (orderItem != null) {
                orderItem.setQuantity(quantity);
                orderDAO.updateOrderItem(orderItem);
                response.sendRedirect("/IoTBay/UpdateOrder?id=" + orderItem.getOrderId());
                success = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!success) {
            request.getRequestDispatcher("updateOrderItem.jsp").include(request, response);
        }
    }
}
