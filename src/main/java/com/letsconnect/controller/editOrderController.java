package com.letsconnect.controller;

import com.letsconnect.configure.DbConfig;
import com.letsconnect.model.Order;
import com.letsconnect.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/EditOrder")
public class editOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        try (Connection conn = DbConfig.getConnection()) {
            OrderService orderService = new OrderService(conn);
            Order order = orderService.getOrderById(orderId);  // You will add this method in OrderService

            if (order != null) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("/WEB-INF/Pages/editOrder.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/Orders?error=OrderNotFound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching order details.");
            request.getRequestDispatcher("/WEB-INF/Pages/orderManagement.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle form submission to update the order

        String orderId = request.getParameter("orderId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String location = request.getParameter("location");
        String deliveryId = request.getParameter("deliveryId");
        String paymentId = request.getParameter("paymentId");
        String status = request.getParameter("status");

        try (Connection conn = DbConfig.getConnection()) {
            OrderService orderService = new OrderService(conn);
            Order updatedOrder = new Order(orderId, quantity, totalPrice, location, deliveryId, paymentId, status);

            orderService.updateOrder(updatedOrder);  // You will add this method in OrderService

            response.sendRedirect(request.getContextPath() + "/Orders");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to update order.");
            request.getRequestDispatcher("/WEB-INF/Pages/editOrder.jsp").forward(request, response);
        }
    }
}