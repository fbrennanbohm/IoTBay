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
public class Payment {
<<<<<<< Updated upstream
=======
    private int paymentMethodID;
    private int userId;
    private int cardNumber;
    private int cvc;
    private String type;    
    private String name;
    private String expiryDate;
>>>>>>> Stashed changes

    private int paymentId;
    private int orderId;
    private int paymentMethodId;
    private double paidAmount;
    private String detail;

<<<<<<< Updated upstream
    public Payment(int paymentId, int orderId, int paymentMethodId, double paidAmount, String detail) {
=======
    public Payment(int paymentMethodID, int userId, int cardNumber, int cvc, String type, String name, String expiryDate) {
        this.paymentMethodID = paymentMethodID;
        this.userId = userId;
        this.cardNumber = cardNumber;
        this.cvc = cvc;
        this.type = type;
        this.name = name;
        this.expiryDate = expiryDate;
    }
    
        public Payment(int paymentMethodID, int paymentId, int orderId, double paidAmount, String detail) {
        this.paymentMethodID = paymentMethodID;
>>>>>>> Stashed changes
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.paymentMethodId = paymentMethodId;
        this.paidAmount = paidAmount;
        this.detail = detail;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public double getPaidAmount() {
        return paidAmount;
    }

    public String getDetail() {
        return detail;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

}
