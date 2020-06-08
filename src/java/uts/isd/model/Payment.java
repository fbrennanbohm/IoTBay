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
    private int paymentMethodID;
    private int cardNumber;
    private int cvc;
    private String type;    
    private String name;
    private String expiryDate;

    private int paymentId;
    private int orderId;    
    private double paidAmount;
    private String detail;

    public Payment(int paymentMethodID, int cardNumber, int cvc, String type, String name, String expiryDate) {
        this.paymentMethodID = paymentMethodID;
        this.cardNumber = cardNumber;
        this.cvc = cvc;
        this.type = type;
        this.name = name;
        this.expiryDate = expiryDate;
    }
    
        public Payment(int paymentMethodID, int paymentId, int orderId, double paidAmount, String detail) {
        this.paymentMethodID = paymentMethodID;
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.paidAmount = paidAmount;
        this.detail = detail;
    }

    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public int getCvc() {
        return cvc;
    }

    public String getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

        public int getPaymentId() {
        return paymentId;
    }

    public int getOrderId() {
        return orderId;
    }

    public double getPaidAmount() {
        return paidAmount;
    }

    public String getDetail() {
        return detail;
    }
    
    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setCvc(int cvc) {
        this.cvc = cvc;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
    
        public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
}
