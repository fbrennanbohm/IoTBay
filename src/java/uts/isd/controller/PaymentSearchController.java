package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.User;
import uts.isd.model.dao.UserDAO;

/**
 * This servlet searches the database for users that match the name and email specified by the user.
 * It then sets the list of results in the JSP request object.
 * 
 * @author Patrick
 */
public class PaymentSearchController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");    
        HttpSession session = request.getSession();
        
        int paymentId = Integer.parseInt(request.getParameter("paymentID"));
        String date = request.getParameter("date");
        
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        try {
            List<Payment> paymentList = userDAO.searchPayment(paymentId, date);
            request.setAttribute("paymentList", paymentList);
            request.setAttribute("paymendId", paymentId);
            request.setAttribute("date", date);
        }
        catch (SQLException ex) {
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("userPayment.jsp").forward(request, response);
    }
}
