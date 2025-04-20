package com.letsconnect.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Admin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO: Replace these with actual database logic
		int totalOrders = 9;
		int totalProducts = 21;
		int totalCustomers = 15;

		// Set attributes to be used in JSP
		request.setAttribute("totalOrders", totalOrders);
		request.setAttribute("totalProducts", totalProducts);
		request.setAttribute("totalCustomers", totalCustomers);

		// Forward to Admin Dashboard JSP
		request.getRequestDispatcher("/WEB-INF/Pages/Admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
