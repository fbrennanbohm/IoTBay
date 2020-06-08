package uts.isd.model.dao;

import uts.isd.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
* DBManager is the primary DAO class to interact with the database.
* Performs CRUD operations with the db.
 */
public class ProductDAO {

    private Statement st;

    public ProductDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public Product getProduct(int id) throws SQLException {
        String query = "SELECT * FROM product WHERE productId=" + id;
        ResultSet rs = st.executeQuery(query);

        Product product = null;

        if (rs.next()) {
            String name = rs.getString("name");
            String description = rs.getString("description");
            int stockQuantity = rs.getInt("stockQuantity");
            double price = rs.getDouble("price");
            String imageUrl = rs.getString("imageUrl");

            product = new Product(id, name, description, stockQuantity, price, imageUrl);
        }
        rs.close();

        return product;
    }

    public List<Product> listProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();

        String query = "SELECT * FROM product ORDER BY productId ASC";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

            int productId = rs.getInt("productId");
            String name = rs.getString("name");
            String description = rs.getString("description");
            Integer stockQuantity = rs.getInt("stockQuantity");
            Float price = rs.getFloat("price");
            String imageUrl = rs.getString("imageUrl");

            Product product = new Product(productId, name, description, stockQuantity, price, imageUrl);
            productList.add(product);
        }
        rs.close();
        return productList;
    }
}
