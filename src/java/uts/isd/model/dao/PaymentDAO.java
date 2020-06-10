package uts.isd.model.dao;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import uts.isd.model.PaymentMethod;
import java.util.ArrayList;
import java.util.List;
import uts.isd.model.Payment;

public class PaymentDAO {

    private Statement st;

    public PaymentDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public void CreatePayment(int orderId, int paymentMethodId, double paidAmount, String detail) throws SQLException { //code for add-operation

        String query = "INSERT INTO PAYMENT (orderId, paymentMethodId, paidAmount, detail) VALUES("
                + orderId + ", " + paymentMethodId + ", " + paidAmount + ", " + wrapStr(detail) + ")";
        st.executeUpdate(query);
    }
    
    public List<Payment> getPaymentList(int paymentId, int userId) throws SQLException {
        List<Payment> paymentList = new ArrayList<>();
        String query = "SELECT * FROM \"Payment\" WHERE PaymentId=" + paymentId + "AND USERID=" + userId;
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
            
            Payment payment = this.buildPayment(rs);
            paymentList.add(payment);
        }
        rs.close();
        
        return paymentList;
    }
    
    public List<Payment> getPaymentList(int paymentId) throws SQLException {
        List<Payment> paymentList = new ArrayList<>();
        String query = "SELECT * FROM \"Payment\" WHERE PAYMENTID =" + paymentId;
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
            
            Payment payment = this.buildPayment(rs);
            paymentList.add(payment);
        }
        rs.close();
        
        return paymentList;
    }
        
    
       private Payment buildPayment(ResultSet rs) throws SQLException {
           int paymentId = rs.getInt("PAYMENTID");
           int userId = rs.getInt("USERID");
           int orderId = rs.getInt("ORDERID");
           int paymentMethodId = rs.getInt("PAYMENTMETHODID");
           double amount = rs.getDouble("PAIDAMOUNT");
           String detail = rs.getString("DETAIL");
           
           Payment payment = new Payment(paymentId, userId, orderId, paymentMethodId, amount, detail);
           return payment;
       }
       
    private String wrapStr(String input) {
        return "'" + input + "'";
    }
}
