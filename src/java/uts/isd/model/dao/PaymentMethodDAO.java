package uts.isd.model.dao;

import uts.isd.model.Product;
import java.sql.*;
import uts.isd.model.Payment;


public class PaymentMethodDAO {

    private Statement st;

    public PaymentMethodDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
   
    
    public Payment findPayment(int card) throws SQLException {
        String query = "SELECT * FROM Paymentmethod WHERE CardNumber=" + card;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentMethodID = rs.getInt("PaymentMethodID");
            int cardNumber = rs.getInt("CardNumber");
            int cvc = rs.getInt("CVC");
            String type = rs.getString("Type");    
            String name = rs.getString("Name");
            String expiryDate = rs.getString("VALIDUNTIL");
            return new Payment(paymentMethodID, cardNumber, cvc, type, name, expiryDate);
        }
        rs.close();
        return null;
    }
    
        public Payment findPayment(String card) throws SQLException {
        String query = "SELECT * FROM Paymentmethod WHERE CardNumber=" + card;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentMethodID = rs.getInt("PaymentMethodID");
            int cardNumber = rs.getInt("CardNumber");
            int cvc = rs.getInt("CVC");
            String type = rs.getString("Type");    
            String name = rs.getString("Name");
            String expiryDate = rs.getString("VALIDUNTIL");
            return new Payment(paymentMethodID, cardNumber, cvc, type, name, expiryDate);
        }
        rs.close();
        return null;
    }

    public void addPaymentMethod(String paymentType, String cardNumber, String cardHolder, String expiryDate, String cvc) throws SQLException { //code for add-operation

        String query = "INSERT INTO PaymentMethod (roleId, firstName, lastName, email, password) VALUES("
                + cardNumber + ", " + wrapStr(cardHolder) + ", " + wrapStr(expiryDate) + ", "
                + wrapStr(cvc) + ")";
        st.executeUpdate(query);
    }
    
    public void deletePaymentMethod(int paymentMethodId) throws SQLException {
        //code for delete-operation
        st.executeUpdate("DELETE FROM PaymentMethod WHERE userID=" + paymentMethodId);
    
    
    }
    
        private String wrapStr(String input) {
        return "'" + input + "'";
    }
}

