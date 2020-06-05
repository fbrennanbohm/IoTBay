package uts.isd.model;

/**
 *
 * @author Patrick
 */
public class Product implements java.io.Serializable {

    private int productId;
    private String name;
    private String description;
    private double price;
    private int stockQuantity;

    public Product(int productId, String name, String description, int stockQuantity, double price) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.stockQuantity = stockQuantity;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int id) {
        this.productId = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int quantity) {
        this.stockQuantity = quantity;
    }
}
