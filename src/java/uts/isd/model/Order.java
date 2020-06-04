package uts.isd.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Patrick
 */
public class Order implements java.io.Serializable {

    private int orderId;
    private int userId;
    private String orderNumber;
    private Date createdOn;
    private List<OrderItem> orderList = new ArrayList<>();

    public Order(int orderId, int userId, String orderNumber, Date createdOn, List<OrderItem> orderList) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderNumber = orderNumber;
        this.createdOn = createdOn;
        this.orderList = orderList;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getUserId() {
        return userId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public List<OrderItem> getOrderList() {
        return orderList;
    }
}
