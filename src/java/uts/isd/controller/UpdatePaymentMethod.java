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
import uts.isd.controller.ConnServlet;
import uts.isd.controller.UpdateOrderController;
import uts.isd.model.Order;
import uts.isd.model.Payment;
import uts.isd.model.PaymentMethod;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrderDAO;
import uts.isd.model.dao.PaymentMethodDAO;

/**
 * This  loads the order history page.
 *
 * @author Patrick
 */
public class UpdatePaymentMethod extends HttpServlet {

    private PaymentMethodDAO paymentMethodDAO;

    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            paymentMethodDAO = new PaymentMethodDAO(conn);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int updateId = Integer.parseInt(request.getParameter("UpdatePaymentID")); // get userId from HTTP request parameter

        try {
            PaymentMethod payment = paymentMethodDAO.getPaymentMethod(updateId);

            request.setAttribute("paymentUpdate", payment);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("ConfirmUpdate.jsp").forward(request, response);
    }
}
