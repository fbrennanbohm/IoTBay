package uts.isd.model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Patrick
 */
public class Order implements java.io.Serializable {
    private String orderId;
    private String customerId;
    private Date orderDate;
    private ArrayList<Product> productList = new ArrayList<>();

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public ArrayList<Product> getProductList() {
        return productList;
    }

    public void setProductList(ArrayList<Product> productList) {
        this.productList = productList;
    }
    
}
