package com.letsconnect.controller;

import com.letsconnect.configure.DbConfig;
import com.letsconnect.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/DeleteOrder")
public class DeleteOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        try (Connection conn = DbConfig.getConnection()) {
            OrderService orderService = new OrderService(conn);
            boolean deleted = orderService.deleteOrder(orderId);  // Add this method to OrderService

            if (!deleted) {
                request.setAttribute("error", "Failed to delete order.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error deleting order.");
        }
        // Redirect back to orders list after deletion
        response.sendRedirect(request.getContextPath() + "/Orders");
    }
}