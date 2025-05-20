package com.letsconnect.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Admin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO: Replace these with actual database logic
		int totalOrders = 9; // Replace with actual database call to fetch total orders
		int totalProducts = 21; // Replace with actual database call to fetch total products
		int totalCustomers = 15; // Replace with actual database call to fetch total customers

		// Data for the chart (replace with actual database calls)
		List<String> chartLabels = Arrays.asList("Jan", "Feb", "Mar", "Apr", "May");
		List<Integer> ordersData = Arrays.asList(5, 7, 9, 12, 15);
		List<Integer> productsData = Arrays.asList(10, 12, 15, 17, 20);

		// Set attributes to be used in JSP
		request.setAttribute("totalOrders", totalOrders);
		request.setAttribute("totalProducts", totalProducts);
		request.setAttribute("totalCustomers", totalCustomers);
		request.setAttribute("chartLabels", chartLabels);
		request.setAttribute("ordersData", ordersData);
		request.setAttribute("productsData", productsData);

		// Forward to Admin Dashboard JSP
		request.getRequestDispatcher("/WEB-INF/Pages/Admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
