
package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.Shipment;
import uts.isd.model.dao.PaymentDAO;
import uts.isd.model.dao.ShipmentDAO;

/**
 *
 * @author Jack
 */
public class PaymentSearchController extends HttpServlet {

    private ShipmentDAO shipmentDAO;
    private PaymentDAO paymentDAO;
    
    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            paymentDAO = new PaymentDAO(conn);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {   
        response.setContentType("text/html;charset=UTF-8");
        int paymentId = Integer.parseInt(request.getParameter("paymentID"));
        int userId = Integer.parseInt(request.getParameter("id"));
        
        
        try {
            List<Payment> paymentList = paymentDAO.getPaymentList(paymentId, userId);
            request.setAttribute("paymentList", paymentList);
        }
        catch (SQLException ex){
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
        }   
        request.getRequestDispatcher("payment.jsp").include(request,response);
    }
}