/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author Ricky
 */
public class UserCartProduct {

    private int userCartProductId;
    private int userId;
    private int productId;
    private Product product;
    private int quantity;

    public UserCartProduct(int userCartProductId, int userId, int productId, int quantity) {
        this.userCartProductId = userCartProductId;
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getUserCartProductId() {
        return userCartProductId;
    }

    public int getUserId() {
        return userId;
    }

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotalPrice() {
        return Math.round(this.getProduct().getPrice() * this.quantity * 100.0) / 100.0;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Product getProduct() {
        return this.product;
    }
}
