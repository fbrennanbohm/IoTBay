package uts.isd.model.dao;

import java.sql.*;
import uts.isd.model.Payment;
import uts.isd.model.PaymentMethod;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAO {

    private Statement st;

    public PaymentMethodDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }


    public PaymentMethod getPaymentMethod(String card) throws SQLException {
        String query = "SELECT * FROM PAYMENTMETHOD WHERE CardNumber=" + card;
        ResultSet rs = st.executeQuery(query);

        PaymentMethod paymentMethod = null;
        if (rs.next()) {
            paymentMethod = buildPaymentMethod(rs);
        }
        rs.close();
        return null;
    }

    public PaymentMethod findPayment(int paymentId) throws SQLException {
        String query = "SELECT * FROM PaymentMethod WHERE PAYMENTMETHODID=" + paymentId;
        ResultSet rs = st.executeQuery(query);
        int paymentMethodID;
        int userID;  
        String cardNumber;
        String cvc;
        String type;
        String name;
        Date expiryDate;
        while (rs.next()) {
            paymentMethodID = rs.getInt("PaymentMethodID");
            userID = rs.getInt("UserId");
            cardNumber = rs.getString("CardNumber");
            cvc = rs.getString("CVC");
            type = rs.getString("Type");    
            name = rs.getString("Name");
            expiryDate = rs.getDate("VALIDUNTIL");
            rs.close();
        return new PaymentMethod(paymentMethodID, userID, type, cardNumber, name, expiryDate, cvc);
        }
        return null;
   }
    public PaymentMethod getPaymentMethod(int paymentMethodId) throws SQLException {
        String query = "SELECT * FROM PAYMENTMETHOD WHERE paymentMethodId=" + paymentMethodId;
        ResultSet rs = st.executeQuery(query);

        PaymentMethod paymentMethod = null;
        if (rs.next()) {
            paymentMethod = buildPaymentMethod(rs);
}
        rs.close();
        return paymentMethod;
    }

    
    public PaymentMethod getPayment(int id) throws SQLException {
        String query = "SELECT * FROM \"PaymentMethodID\" WHERE paymentmethodid=" + id;
        ResultSet rs = st.executeQuery(query);

        PaymentMethod payment = null;
        if (rs.next()) {
            payment = this.buildOrder(rs);
        }
        rs.close();
        return payment;
    }

    public List<PaymentMethod> getPaymentMethodList(int userId) throws SQLException {


        List<PaymentMethod> paymentMethodList = new ArrayList<>();
        String query = "SELECT * FROM \"PAYMENTMETHOD\" WHERE userid=" + userId;
        ResultSet rs = st.executeQuery(query);
        List<PaymentMethod> paymentMethods = null;   
        while (rs.next()) {
            PaymentMethod paymentMethod = this.buildPaymentMethod(rs);

            paymentMethodList.add(paymentMethod);
        }
        rs.close();

        return paymentMethods;
    }
    
    private PaymentMethod buildOrder(ResultSet rs) throws SQLException {
        int paymentMethodID = rs.getInt("PaymentMethodID");
        int userID = rs.getInt("UserId");
        String cardNumber = rs.getString("CardNumber");
        String cvc = rs.getString("CVC");
        String type = rs.getString("Type");    
        String name = rs.getString("Name");
        Date expiryDate = rs.getDate("VALIDUNTIL");
        return new PaymentMethod(paymentMethodID, userID, type, cardNumber, name, expiryDate, cvc);

    }
    

    private PaymentMethod buildPaymentMethod(ResultSet rs) throws SQLException {

        int paymentMethodId = rs.getInt("PaymentMethodID");
        int userId = rs.getInt("userId");
        String cardNumber = rs.getString("CardNumber");
        String cvc = rs.getString("CVC");
        String type = rs.getString("Type");
        String name = rs.getString("Name");
        Date expiryDate = rs.getDate("VALIDUNTIL");
        return new PaymentMethod(paymentMethodId, userId, type, cardNumber, name, expiryDate, cvc);
    }

    public void addPaymentMethod(String paymentType, String cardNumber, String cardHolder, String expiryDate, String cvc) throws SQLException { //code for add-operation

        String query = "INSERT INTO PAYMENTMETHOD (roleId, firstName, lastName, email, password) VALUES("
                + cardNumber + ", " + wrapStr(cardHolder) + ", " + wrapStr(expiryDate) + ", "
                + wrapStr(cvc) + ")";
        st.executeUpdate(query);
    }

    public void deletePaymentMethod(int paymentMethodId) throws SQLException {
        //code for delete-operation
        st.executeUpdate("DELETE FROM PAYMENTMETHOD WHERE userID=" + paymentMethodId);

    }

    private String wrapStr(String input) {
        return "'" + input + "'";
    }
}
