package uts.isd.model;

import java.util.ArrayList;

/**
 *
 * @author Patrick
 */
public class Cart implements java.io.Serializable {
    private String id;
    private String userId;
    private ArrayList<Product> productList = new ArrayList<>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public ArrayList<Product> getProductList() {
        return productList;
    }

    public void addProduct(Product product) {
        this.productList.add(product);
    }
    
    public void removeProduct(Product product) {
        this.productList.remove(product);
    }
    
}
