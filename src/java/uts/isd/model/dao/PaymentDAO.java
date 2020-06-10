package uts.isd.model.dao;

import java.sql.*;
import uts.isd.model.PaymentMethod;
import java.util.ArrayList;
import java.util.List;

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

    private String wrapStr(String input) {
        return "'" + input + "'";
    }
}
