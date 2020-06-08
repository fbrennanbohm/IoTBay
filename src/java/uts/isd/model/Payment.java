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

    private int paymentId;
    private int orderId;
    private int paymentMethodId;
    private double paidAmount;
    private String detail;

    public Payment(int paymentId, int orderId, int paymentMethodId, double paidAmount, String detail) {
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
