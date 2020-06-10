
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
import uts.isd.model.dao.DBConnector;
import uts.isd.model.Shipment;
import uts.isd.model.dao.ShipmentDAO;

/**
 *
 * @author Jack
 */
public class ShipmentServlet extends HttpServlet {

    private ShipmentDAO shipmentDAO;
    
    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            shipmentDAO = new ShipmentDAO(conn);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {   
        System.out.println("doget");
        response.setContentType("text/html;charset=UTF-8");
        int userId = Integer.parseInt(request.getParameter("id"));
        
        
        try {
            List<Shipment> shipmentList = shipmentDAO.getUserShipmentList(userId);
            request.setAttribute("shipmentList", shipmentList);
        }
        catch (SQLException ex){
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
        }   
        request.getRequestDispatcher("shipment.jsp").include(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");
        int userId = Integer.parseInt(request.getParameter("id"));
        String search = request.getParameter("search");
        
        try {
            System.out.println("doPost");
            List<Shipment> shipmentList = shipmentDAO.getShipmentSearchList(userId, search); //with search param
            request.setAttribute("shipmentList", shipmentList);
        }
        catch (SQLException ex){
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
        } catch (ParseException ex) {   
            Logger.getLogger(ShipmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("shipment.jsp").include(request,response);
    }
}
