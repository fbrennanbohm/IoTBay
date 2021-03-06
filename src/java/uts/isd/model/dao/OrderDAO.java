package uts.isd.model.dao;

import uts.isd.model.Order;
import uts.isd.model.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
* DBManager is the primary DAO class to interact with the database.
* Performs CRUD operations with the db.
 */
public class OrderDAO {

    private Connection conn;
    private Statement st;

    public OrderDAO(Connection conn) throws SQLException {
        this.conn = conn;
        st = conn.createStatement();
    }

    public List<Order> getUserOrderList(int userId) throws SQLException {
        List<Order> orderList = new ArrayList<>();
        String query = "SELECT * FROM \"ORDER\" WHERE userid=" + userId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            Order order = this.buildOrder(rs);

            orderList.add(order);
        }
        rs.close();

        for (Order order : orderList) {
            order.setOrderItemList(this.getOrderItemList(order.getOrderId()));
        }

        return orderList;
    }

    public List<Order> getUserOrderList(int userId, String orderNumberSearch) throws SQLException {
        List<Order> orderList = new ArrayList<>();
        String query = "SELECT * FROM \"ORDER\" WHERE userid=" + userId + " AND orderNumber LIKE '%" + orderNumberSearch + "%'";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            Order order = this.buildOrder(rs);

            orderList.add(order);
        }
        rs.close();

        for (Order order : orderList) {
            order.setOrderItemList(this.getOrderItemList(order.getOrderId()));
        }

        return orderList;
    }

    public Order getOrder(int id) throws SQLException {
        String query = "SELECT * FROM \"ORDER\" WHERE orderid=" + id;
        ResultSet rs = st.executeQuery(query);

        Order order = null;
        if (rs.next()) {
            order = this.buildOrder(rs);
        }
        rs.close();

        if (order != null) {
            order.setOrderItemList(this.getOrderItemList(id));
        }

        return order;
    }

    public void createOrder(int userId, String orderNumber, Date createdOn, String orderStatus) throws SQLException {

        st.executeUpdate("INSERT INTO \"ORDER\" (USERID, ORDERNUMBER, CREATEDON, ORDERSTATUS) "
                + "VALUES (" + userId + ", " + wrapStr(orderNumber) + ", " + wrapDate(createdOn) + ", " + wrapStr(orderStatus)
                + ")");
    }

    public void createOrderItem(int orderId, int productId, int quantity, double pricePerUnit) throws SQLException {

        st.executeUpdate("INSERT INTO \"ORDERITEM\" (ORDERID, PRODUCTID, QUANTITY, PRICEPERUNIT) "
                + "VALUES (" + orderId + ", " + productId + ", " + quantity + ", " + pricePerUnit
                + ")");
    }

    public void deleteOrder(int id) throws SQLException {
        this.deleteOrderItemList(id);
        st.executeUpdate("DELETE FROM \"ORDER\" WHERE ORDERID=" + id);
    }

    public void deleteOrderItem(int orderItemId) throws SQLException {
        st.executeUpdate("DELETE FROM \"ORDERITEM\" WHERE ORDERITEMID=" + orderItemId);
    }

    public void deleteOrderItemList(int orderId) throws SQLException {
        st.executeUpdate("DELETE FROM \"ORDERITEM\" WHERE ORDERID=" + orderId);
    }

    public List<OrderItem> getOrderItemList(int orderId) throws SQLException {
        List<OrderItem> orderItemList = new ArrayList<>();
        String query = "SELECT * FROM ORDERITEM WHERE orderId=" + orderId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

            OrderItem orderItem = this.buildOrderItem(rs);
            orderItemList.add(orderItem);
        }
        rs.close();

        ProductDAO productDao = new ProductDAO(this.conn);
        for (OrderItem orderItem : orderItemList) {
            orderItem.setProduct(productDao.getProduct(orderItem.getProductId()));
        }

        return orderItemList;
    }

    public OrderItem getOrderItem(int id) throws SQLException {

        String query = "SELECT * FROM \"ORDERITEM\" WHERE orderItemid=" + id;
        ResultSet rs = st.executeQuery(query);

        OrderItem orderItem = null;
        if (rs.next()) {
            orderItem = this.buildOrderItem(rs);
        }
        rs.close();

        if (orderItem != null) {
            ProductDAO productDao = new ProductDAO(this.conn);
            orderItem.setProduct(productDao.getProduct(orderItem.getProductId()));
        }

        return orderItem;
    }

    public void updateOrder(Order order) throws SQLException {
        st.executeUpdate("UPDATE \"ORDER\" SET USERID=" + order.getUserId() + ", ORDERNUMBER=" + wrapStr(order.getOrderNumber())
                + ", CREATEDON=" + wrapDate(order.getCreatedOn()) + ", ORDERSTATUS=" + wrapStr(order.getOrderStatus())
                + " WHERE orderId=" + order.getOrderId());
    }

    public void updateOrderItem(OrderItem orderItem) throws SQLException {
        st.executeUpdate("UPDATE ORDERITEM SET PRODUCTID=" + orderItem.getProductId() + ", QUANTITY=" + orderItem.getQuantity() + ", PRICEPERUNIT=" + orderItem.getPricePerUnit()
                + " WHERE orderItemId=" + orderItem.getOrderItemId());
    }

    private Order buildOrder(ResultSet rs) throws SQLException {
        int orderId = rs.getInt("orderId");
        int userId = rs.getInt("userId");
        String orderNumber = rs.getString("orderNumber");
        Date createdOn = rs.getDate("createdOn");
        String orderStatus = rs.getString("orderStatus");

        Order order = new Order(orderId, userId, orderNumber, createdOn, orderStatus);

        return order;
    }

    private OrderItem buildOrderItem(ResultSet rs) throws SQLException {
        int orderItemId = rs.getInt("orderItemId");
        int orderId = rs.getInt("orderId");
        int productId = rs.getInt("productId");
        int quantity = rs.getInt("quantity");
        double pricePerUnit = rs.getDouble("pricePerUnit");

        OrderItem orderItem = new OrderItem(orderItemId, orderId, productId, quantity, pricePerUnit);

        return orderItem;
    }

    private String wrapStr(String input) {
        return "'" + input + "'";
    }

    private String wrapDate(java.util.Date input) {
        return "'" + input + "'";
    }
}
