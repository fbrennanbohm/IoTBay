package uts.isd.model.dao;

import uts.isd.model.Order;
import uts.isd.model.OrderItem;
import uts.isd.model.Product;
import uts.isd.model.dao.ProductDAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
* DBManager is the primary DAO class to interact with the database.
* Performs CRUD operations with the db.
 */
public class OrderDAO {

    private Statement st;

    public OrderDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public List<Order> getUserOrderList(int userId) throws SQLException {
        List<Order> orderList = new ArrayList<>();
        String query = "SELECT * FROM ORDER WHERE userid=" + userId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int orderId = rs.getInt("orderId");
            String orderNumber = rs.getString("orderNumber");
            Date createdOn = rs.getDate("createdOn");
            List<OrderItem> orderItemList = getOrderItemList(orderId);

            Order order = new Order(orderId, userId, orderNumber, createdOn, orderItemList);
            orderList.add(order);
        }
        rs.close();
        return orderList;
    }

    public List<OrderItem> getOrderItemList(int orderId) throws SQLException {
        List<OrderItem> orderItemList = new ArrayList<>();
        String query = "SELECT * FROM ORDERITEM WHERE orderId=" + orderId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int orderItemId = rs.getInt("orderItemId");
            int productId = rs.getInt("productId");
            int quantity = rs.getInt("quantity");
            double pricePerUnit = rs.getInt("pricePerUnit");

            ProductDAO productDao = new ProductDAO(st);
            Product product = productDao.getProduct(productId);

            OrderItem orderItem = new OrderItem(orderItemId, orderId, product, quantity, pricePerUnit);
            orderItemList.add(orderItem);
        }
        rs.close();

        return orderItemList;
    }
}
