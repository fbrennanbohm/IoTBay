package uts.isd.model.dao;

import uts.isd.model.Product;
import java.sql.*;

/*
* DBManager is the primary DAO class to interact with the database.
* Performs CRUD operations with the db.
 */
public class ProductDAO {

    private Statement st;

    public ProductDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public ProductDAO(Statement st) throws SQLException {
        this.st = st;
    }

    public Product getProduct(int id) throws SQLException {
        String query = "SELECT * FROM PRODUCT WHERE productId=" + id;
        ResultSet rs = st.executeQuery(query);

        Product product = null;

        if (rs.next()) {
            String name = rs.getString("name");
            String description = rs.getString("description");
            int stockQuantity = rs.getInt("stockQuantity");
            double price = rs.getDouble("price");

            product = new Product(id, name, description, stockQuantity, price);
        }
        rs.close();

        return product;
    }
}
