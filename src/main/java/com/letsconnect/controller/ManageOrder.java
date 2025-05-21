package com.letsconnect.controller;

import com.letsconnect.model.Order;
import com.letsconnect.service.OrderService;
import com.letsconnect.configure.DbConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Orders")
public class ManageOrder extends HttpServlet {

    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       

        try (Connection connection = DbConfig.getConnection()) {
            

            OrderService orderService = new OrderService(connection);
            

            List<Order> orders = orderService.getAllOrders();
           

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/WEB-INF/Pages/Mangeorder.jsp").forward(request, response);
            

        } catch (SQLException e) {
            System.err.println("[ManageOrderController] SQLException occurred: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/Mangeorder.jsp").forward(request, response);
            
        }
    }
}