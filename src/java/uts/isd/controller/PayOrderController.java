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
import uts.isd.model.OrderItem;
import uts.isd.model.PaymentMethod;
import uts.isd.model.Product;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrderDAO;
import uts.isd.model.dao.PaymentDAO;
import uts.isd.model.dao.PaymentMethodDAO;
import uts.isd.model.dao.ProductDAO;
import java.util.List;

/**
 * This servlet loads the order history page.
 *
 * @author Patrick
 */
public class PayOrderController extends HttpServlet {

    private OrderDAO orderDAO;
    private PaymentDAO paymentDAO;
    private PaymentMethodDAO paymentMethodDAO;
    private ProductDAO productDAO;

    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            orderDAO = new OrderDAO(conn);
            paymentDAO = new PaymentDAO(conn);
            paymentMethodDAO = new PaymentMethodDAO(conn);
            productDAO = new ProductDAO(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int orderId = Integer.parseInt(request.getParameter("id")); // get userId from HTTP request parameter

        try {
            Order order = orderDAO.getOrder(orderId);
            List<PaymentMethod> paymentMethodList = paymentMethodDAO.getPaymentMethodList(order.getUserId());
            request.setAttribute("order", order);
            request.setAttribute("paymentMethodList", paymentMethodList);
        } catch (SQLException ex) {
            Logger.getLogger(PayOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("payOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int orderId = Integer.parseInt(request.getParameter("id")); // get orderId from HTTP request parameter
        int paymentMethodId = Integer.parseInt(request.getParameter("paymentMethodId")); // get paymentMethodId from HTTP request parameter

        boolean success = false;
        try {
            Order order = orderDAO.getOrder(orderId);
            PaymentMethod paymentMethod = paymentMethodDAO.getPaymentMethod(paymentMethodId);

            paymentDAO.CreatePayment(order.getOrderId(), paymentMethod.getPaymentMethodId(), order.getTotalPrice(), "Paid");

            for (OrderItem orderItem : order.getOrderItemList()) {
                Product product = productDAO.getProduct(orderItem.getProductId());
                product.setStockQuantity(Math.max(product.getStockQuantity() - orderItem.getQuantity(), 0));
                productDAO.updateProduct(product);
            }

            order.setOrderStatus("Paid");

            orderDAO.updateOrder(order);

            response.sendRedirect("/IoTBay/OrderHistory?id=" + order.getUserId());
            success = true;
        } catch (SQLException ex) {
            Logger.getLogger(PayOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!success) {
            request.getRequestDispatcher("payOrder.jsp").include(request, response);
        }
    }
}
