package uts.isd.model.dao;

import java.sql.*;
import uts.isd.model.PaymentMethod;

public class PaymentMethodDAO {

    private Statement st;

    public PaymentMethodDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
<<<<<<< Updated upstream

    public PaymentMethod findPayment(String card) throws SQLException {
        String query = "SELECT * FROM Paymentmethod WHERE CardNumber=" + card;
        ResultSet rs = st.executeQuery(query);

        PaymentMethod paymentMethod = null;
        if (rs.next()) {
            paymentMethod = buildPaymentMethod(rs);
=======
   
    
    public Payment findPayment(int paymentId) throws SQLException {
        String query = "SELECT * FROM Paymentmethod WHERE PaymentMethodID=" + paymentId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentMethodID = rs.getInt("PaymentMethodID");
            int userID = rs.getInt("UserId");
            int cardNumber = rs.getInt("CardNumber");
            int cvc = rs.getInt("CVC");
            String type = rs.getString("Type");    
            String name = rs.getString("Name");
            String expiryDate = rs.getString("VALIDUNTIL");
            return new Payment(paymentMethodID, userID, cardNumber, cvc, type, name, expiryDate);
>>>>>>> Stashed changes
        }
        rs.close();
        return paymentMethod;
    }
<<<<<<< Updated upstream

    public PaymentMethod findPayment(int paymentMethodId) throws SQLException {
        String query = "SELECT * FROM Paymentmethod WHERE paymentMethodId=" + paymentMethodId;
        ResultSet rs = st.executeQuery(query);

        PaymentMethod paymentMethod = null;
        if (rs.next()) {
            paymentMethod = buildPaymentMethod(rs);
=======
    
    public Payment getPayment(int id) throws SQLException {
        String query = "SELECT * FROM \"PaymentMethodID\" WHERE paymentmethodid=" + id;
        ResultSet rs = st.executeQuery(query);

        Payment payment = null;
        if (rs.next()) {
            payment = this.buildOrder(rs);
        }
        rs.close();


        return payment;
    }
    
    private Payment buildOrder(ResultSet rs) throws SQLException {
        int paymentMethodID = rs.getInt("PaymentMethodID");
        int userID = rs.getInt("UserId");
        int cardNumber = rs.getInt("CardNumber");
        int cvc = rs.getInt("CVC");
        String type = rs.getString("Type");    
        String name = rs.getString("Name");
        String expiryDate = rs.getString("VALIDUNTIL");
        return new Payment(paymentMethodID, userID, cardNumber, cvc, type, name, expiryDate);
    }
    
    public Payment findPayment(String card) throws SQLException {
        String query = "SELECT * FROM Paymentmethod WHERE CardNumber=" + card;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentMethodID = rs.getInt("PaymentMethodID");
            int userID = rs.getInt("UserId");
            int cardNumber = rs.getInt("CardNumber");
            int cvc = rs.getInt("CVC");
            String type = rs.getString("Type");    
            String name = rs.getString("Name");
            String expiryDate = rs.getString("VALIDUNTIL");
            return new Payment(paymentMethodID, userID, cardNumber, cvc, type, name, expiryDate);
>>>>>>> Stashed changes
        }
        rs.close();
        return paymentMethod;
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
