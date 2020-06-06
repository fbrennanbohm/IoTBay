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
    private String orderStatus;
    private List<OrderItem> orderItemList = new ArrayList<>();

    public Order(int orderId, int userId, String orderNumber, Date createdOn, String orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderNumber = orderNumber;
        this.createdOn = createdOn;
        this.orderStatus = orderStatus;
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

    public String getOrderStatus() {
        return orderStatus;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public double getTotalPrice() {
        double totalPrice = 0;
        for (OrderItem orderItem : orderItemList) {
            totalPrice += (Math.round(orderItem.getPricePerUnit() * orderItem.getQuantity() * 100.0) / 100.0);
        }

        return totalPrice;
    }
}
