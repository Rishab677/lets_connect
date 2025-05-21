package com.letsconnect.service;

import com.letsconnect.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private final Connection connection;

    public OrderService(Connection connection) {
        this.connection = connection;
    }

    public void addOrder(Order order) throws SQLException {
        String sql = "INSERT INTO `order` (OrderID, Quantity, Total_price, location, DeliveryID, PaymentID, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, order.getOrderID());
            stmt.setInt(2, order.getQuantity());
            stmt.setDouble(3, order.getTotalPrice());
            stmt.setString(4, order.getLocation());
            stmt.setString(5, order.getDeliveryID());
            stmt.setString(6, order.getPaymentID());
            stmt.setString(7, order.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM `order`";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                orders.add(mapResultSetToOrder(rs));
            }
        }
        return orders;
    }

    public Order getOrderById(String orderId) throws SQLException {
        String sql = "SELECT * FROM `order` WHERE OrderID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToOrder(rs);
                }
            }
        }
        return null;
    }

    public boolean updateOrder(Order order) throws SQLException {
        String sql = "UPDATE `order` SET Quantity = ?, Total_price = ?, location = ?, DeliveryID = ?, PaymentID = ?, status = ? WHERE OrderID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, order.getQuantity());
            stmt.setDouble(2, order.getTotalPrice());
            stmt.setString(3, order.getLocation());
            stmt.setString(4, order.getDeliveryID());
            stmt.setString(5, order.getPaymentID());
            stmt.setString(6, order.getStatus());
            stmt.setString(7, order.getOrderID());
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public boolean updateOrderStatus(String orderId, String newStatus) throws SQLException {
        String sql = "UPDATE `order` SET status = ? WHERE OrderID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, newStatus);
            stmt.setString(2, orderId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public boolean deleteOrder(String orderId) throws SQLException {
        String sql = "DELETE FROM `order` WHERE OrderID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        }
    }

    private Order mapResultSetToOrder(ResultSet rs) throws SQLException {
        return new Order(
            rs.getString("OrderID"),
            rs.getInt("Quantity"),
            rs.getDouble("Total_price"),
            rs.getString("location"),
            rs.getString("DeliveryID"),
            rs.getString("PaymentID"),
            rs.getString("status")
        );
    }
}