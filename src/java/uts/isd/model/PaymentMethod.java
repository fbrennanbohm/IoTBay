/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.util.Date;

/**
 *
 * @author Ricky
 */
public class PaymentMethod {

    private int paymentMethodId;
    private int userId;
    private String type;
    private String cardNumber;
    private String name;
    private Date expiryDate;
    private String cvc;

    public PaymentMethod(int paymentMethodId, int userId, String type, String cardNumber, String name, Date expiryDate, String cvc) {
        this.paymentMethodId = paymentMethodId;
        this.userId = userId;
        this.type = type;
        this.cardNumber = cardNumber;
        this.name = name;
        this.expiryDate = expiryDate;
        this.cvc = cvc;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCvc() {
        return cvc;
    }

    public String getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

}
