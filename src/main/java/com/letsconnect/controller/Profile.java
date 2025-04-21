package com.letsconnect.controller;



import com.letsconnect.model.User;
import com.letsconnect.service.loginservice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/profile")
public class Profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final loginservice loginService = new loginservice(); // Assuming the loginService handles the user data retrieval.

    // Handles GET request to display the user profile
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the logged-in username from the session
        String username = (String) request.getSession().getAttribute("username");

        // If no username in session, redirect to login page
        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Retrieve the user details using the username
        User user = loginService.getUserByUsername(username);

        // If user is found, set it as a request attribute and forward to profile.jsp
        if (user != null) {
            // You can also add more data if needed (like profile photo or extra attributes)
            request.setAttribute("user", user);

            // Forward the request to profile.jsp
            request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
        } else {
            // If user data is not found, redirect to home page or show an error message
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    // Optional: You may add a POST method to handle form submissions for updating user profile data
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle form submission for updating profile data, if needed
    }
}