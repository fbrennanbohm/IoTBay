package uts.isd.model.dao;

import uts.isd.model.Shipment;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date; 
/**
 *
 * @author Jack
 */
public class ShipmentDAO {
    private Connection conn;
    private Statement st;

    public ShipmentDAO(Connection conn) throws SQLException {
        this.conn = conn;
        st = conn.createStatement();
    }
    
    public List<Shipment> getUserShipmentList(int userId) throws SQLException {
        List<Shipment> shipmentList = new ArrayList<>();
        String query = "SELECT * FROM \"SHIPMENT\" WHERE userid=" + userId;
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
            Shipment shipment = this.buildShipment(rs);
            shipmentList.add(shipment);
        }
        rs.close();
        
        return shipmentList;
    }
    
    public List<Shipment> getShipmentSearchList(int userId, String search) throws SQLException, ParseException {
        List<Shipment> shipmentList = new ArrayList<>();
        int intCheck;
        String query = "";
        try {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date dateCheck = format.parse(search);
            java.sql.Date sqlDate = new java.sql.Date(dateCheck.getTime());
            
            query = "SELECT * FROM \"SHIPMENT\" WHERE userid=" + userId +" AND placedon='" + sqlDate + "'";
        } catch (ParseException e) {
        try {
            intCheck = Integer.parseInt(search);
            
            query = "SELECT * FROM \"SHIPMENT\" WHERE userid=" + userId +" AND shipmentid=" + intCheck;
        } catch (Exception f) {}
        } 
        
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
            Shipment shipment = this.buildShipment(rs);
            shipmentList.add(shipment);
        }
        rs.close();
        
        return shipmentList;
    }
    
    private Shipment buildShipment(ResultSet rs) throws SQLException {
        int shipmentId = rs.getInt("shipmentId");
        int userId = rs.getInt("userId");
        int orderId = rs.getInt("orderId");
        String shipmentNumber = rs.getString("shipmentNumber");
        Date placedOn = rs.getDate("placedOn");
        String method = rs.getString("method");
        String address = rs.getString("address");
        String status = rs.getString("status");

        Shipment shipment = new Shipment(shipmentId, orderId, userId, placedOn, method, address, status);

        return shipment;
    }
}
