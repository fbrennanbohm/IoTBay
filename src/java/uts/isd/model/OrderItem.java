package uts.isd.model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Patrick
 */
public class OrderItem implements java.io.Serializable {

    private int orderItemId;
    private int orderId;
    private Product product;
    private int quantity;
    private double pricePerUnit;

    public OrderItem(int orderItemId, int orderId, Product product, int quantity, double pricePerUnit) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.product = product;
        this.quantity = quantity;
        this.pricePerUnit = pricePerUnit;
    }

    public int getOrderItemId() {
        return this.orderItemId;
    }

    public int getOrderId() {
        return this.orderId;
    }

    public Product getProduct() {
        return this.product;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public double getPricePerUnit() {
        return this.pricePerUnit;
    }
}
