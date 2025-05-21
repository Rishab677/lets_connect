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

@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatusController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");

        System.out.println("[UpdateOrderStatusController] Received update request for OrderID: " + orderId + " with status: " + status);

        try (Connection conn = DbConfig.getConnection()) {
            OrderService orderService = new OrderService(conn);
            orderService.updateOrderStatus(orderId, status);

            String redirectUrl = request.getContextPath() + "/Orders";
            System.out.println("[UpdateOrderStatusController] Redirecting to: " + redirectUrl);
            response.sendRedirect(redirectUrl);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to update order status: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/order.jsp").forward(request, response);
        }
    }
}