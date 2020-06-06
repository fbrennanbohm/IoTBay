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

    public Payment(int paymentMethodID, int cardNumber, int cvc, String type, String name, String expiryDate) {
        this.paymentMethodID = paymentMethodID;
        this.cardNumber = cardNumber;
        this.cvc = cvc;
        this.type = type;
        this.name = name;
        this.expiryDate = expiryDate;
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
    
    
    
}
