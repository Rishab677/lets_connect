package com.letsconnect.model;

public class Order {
    private String orderID;
    private int quantity;
    private double totalPrice;
    private String location;
    private String deliveryID;
    private String paymentID;
    private String status;

    public Order(String orderID, int quantity, double totalPrice, String location, String deliveryID, String paymentID, String status) {
        this.orderID = orderID;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.location = location;
        this.deliveryID = deliveryID;
        this.paymentID = paymentID;
        this.status = status;
    }

    // Getters
    public String getOrderID() { return orderID; }
    public int getQuantity() { return quantity; }
    public double getTotalPrice() { return totalPrice; }
    public String getLocation() { return location; }
    public String getDeliveryID() { return deliveryID; }
    public String getPaymentID() { return paymentID; }
    public String getStatus() { return status; }

    // Setters (if needed)
    public void setStatus(String status) { this.status = status; }
}