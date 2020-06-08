/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author Jack
 */
public class CartItem {
    
    private int cartItemId;
    private int userId;
    private int productId;

    public CartItem(int cartItemId, int userId, int productId) {
        this.cartItemId = cartItemId;
        this.userId = userId;
        this.productId = productId;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public int getUserId() {
        return userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
    
    
    
}
