package uts.isd.model.dao;

import java.sql.*;
import uts.isd.model.*;
import java.util.ArrayList;
import java.util.List;

public class UserCartProductDAO {

    private Statement st;
    private ProductDAO productDAO;

    public UserCartProductDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
        productDAO = new ProductDAO(conn);
    }

    public List<UserCartProduct> getUserCartProductList(int userId) throws SQLException {
        List<UserCartProduct> userCartProductList = new ArrayList<>();

        String query = "SELECT * FROM USERCARTPRODUCTS WHERE userId=" + userId;
        ResultSet rs = st.executeQuery(query);

        if (rs.next()) {
            UserCartProduct userCartProduct = buildUserCartProduct(rs);
            userCartProductList.add(userCartProduct);
        }
        rs.close();

        for (UserCartProduct userCartProduct : userCartProductList) {
            userCartProduct.setProduct(productDAO.getProduct(userCartProduct.getProductId()));
        }

        return userCartProductList;
    }

    private UserCartProduct buildUserCartProduct(ResultSet rs) throws SQLException {

        int userCartProductId = rs.getInt("userCartProductId");
        int userId = rs.getInt("userId");
        int productId = rs.getInt("productId");
        int quantity = rs.getInt("quantity");

        return new UserCartProduct(userCartProductId, userId, productId, quantity);
    }

    public void deleteUserCartProducts(int userId) throws SQLException {
        //code for delete-operation
        st.executeUpdate("DELETE FROM USERCARTPRODUCTS WHERE userID=" + userId);

    }
}