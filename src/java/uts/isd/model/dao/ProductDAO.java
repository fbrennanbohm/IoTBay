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
            String imageUrl = rs.getString("imageUrl");
            double price = rs.getDouble("price");

            product = new Product(id, name, description, stockQuantity, price, imageUrl);
        }
        rs.close();

        return product;
    }

    public void updateProduct(Product product) throws SQLException {
        st.executeUpdate("UPDATE PRODUCT SET NAME=" + wrapStr(product.getName()) + ", DESCRIPTION=" + wrapStr(product.getDescription()) + ", STOCKQUANTITY=" + product.getStockQuantity()
                + ", PRICE=" + product.getPrice() + ", IMAGEURL=" + product.getImageUrl()
                + " WHERE productId=" + product.getProductId());
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

    private String wrapStr(String input) {
        return "'" + input + "'";
    }

    /**
     * Finds product by id
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public Product find(int id) throws SQLException {
        String query = "SELECT * FROM product WHERE productId=" + id;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int productId = rs.getInt("productId");
            String name = rs.getString("name");
            String description = rs.getString("description");
            Integer stockQuantity = rs.getInt("stockQuantity");
            Float price = rs.getFloat("price");
            String imageUrl = rs.getString("imageUrl");

            return new Product(productId, name, description, stockQuantity, price, imageUrl);
        }
        rs.close();
        return null;
    }

    public void update(Product p) throws SQLException {
        st.executeUpdate("UPDATE product SET name='" + p.getName()
                + "', description='" + p.getDescription()
                + "', stockQuantity=" + p.getStockQuantity()
                + ", price=" + p.getPrice()
                + ", imageurl='" + p.getImageUrl()
                + "'" + " WHERE productId =" + p.getProductId());
    }

    public void add(Product p) throws SQLException {
        st.executeUpdate("INSERT INTO product (name, description, stockQuantity, price, imageurl) values("
                + "'" + p.getName()
                + "','" + p.getDescription()
                + "'," + p.getStockQuantity()
                + "," + p.getPrice()
                + ",'" + p.getImageUrl() + "')");
    }
}
