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
import uts.isd.model.Order;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrderDAO;

/**
 * This servlet loads the order history page.
 *
 * @author Patrick
 */
public class DeleteOrderController extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int orderId = Integer.parseInt(request.getParameter("id")); // get userId from HT
        boolean success = false;
        try {

            Order order = orderDAO.getOrder(orderId);
            if (order != null) {
                orderDAO.deleteOrder(orderId);
                response.sendRedirect("/IoTBay/OrderHistory?id=" + order.getUserId());
                success = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!success) {
            request.getRequestDispatcher("orderHistory.jsp").include(request, response);
        }
    }
}
