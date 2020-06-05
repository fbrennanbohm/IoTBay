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
    private int productId;
    private Product product;
    private int quantity;
    private double pricePerUnit;

    public OrderItem(int orderItemId, int orderId, int productId, int quantity, double pricePerUnit) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.pricePerUnit = pricePerUnit;
    }

    public int getOrderItemId() {
        return this.orderItemId;
    }

    public int getOrderId() {
        return this.orderId;
    }

    public int getProductId() {
        return this.productId;
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public double getPricePerUnit() {
        return this.pricePerUnit;
    }

    public double getTotalPrice() {
        return this.quantity * this.pricePerUnit;
    }
}
