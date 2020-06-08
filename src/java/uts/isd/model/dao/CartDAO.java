/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Jack
 */
public class CartDAO {
    
    private Connection conn;
    private Statement st;

    public CartDAO(Connection conn) throws SQLException {
        this.conn = conn;
        st = conn.createStatement();
    }
    
    public List<Integer> getCart(int userId) throws SQLException {
        List<Integer> userCart = new ArrayList<>();
        String query = "SELECT * FROM Cartitems WHERE userId=" + userId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int productId = rs.getInt("productId");
            userCart.add(productId);
        }
        rs.close();
        
        return userCart;
    }
    
    public void addCartItem(int userId, int productId) throws SQLException {
        String query = "INSERT INTO CartItems (userId, productId) VALUES ("
                + userId + ", " + productId + ")";
        System.out.println(query);
        st.executeUpdate(query);
    }
}
