package uts.isd.model.dao;

import java.sql.*;
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
        return paymentMethod;
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

    public List<PaymentMethod> getPaymentMethodList(int userId) throws SQLException {

        List<PaymentMethod> paymentMethodList = new ArrayList<>();
        String query = "SELECT * FROM \"PAYMENTMETHOD\" WHERE userid=" + userId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            PaymentMethod paymentMethod = this.buildPaymentMethod(rs);

            paymentMethodList.add(paymentMethod);
        }
        rs.close();

        return paymentMethodList;
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
