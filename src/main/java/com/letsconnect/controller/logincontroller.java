package com.letsconnect.controller;

import java.io.IOException;
import com.letsconnect.model.User;
import com.letsconnect.service.loginservice;
import com.letsconnect.util.CookieUtil;
import com.letsconnect.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class logincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Initialize loginService to handle business logic
    private final loginservice loginService = new loginservice();

    // Handles GET request, usually for displaying the login form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward request to the login JSP page
        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
    }

    // Handles POST request, which is used for form submission (login attempt)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Retrieve form parameters (username and password) from the request
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Check if both username and password are provided
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            // Set error message if either username or password is missing
            req.setAttribute("error", "Please fill in both username and password.");
            // Forward to login page with error message
            req.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(req, resp);
            return;
        }

        // Trim any leading/trailing spaces from the username and password
        username = username.trim();
        password = password.trim();

        // Create a User object to hold the entered username and password
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        // Call loginService to validate user credentials
        boolean isValidUser = loginService.loginUser(user);

        // If credentials are valid, create a session and set a cookie
        if (isValidUser) {
            // Store username in session
            SessionUtil.setAttribute(req, "username", username);
            // Add a cookie to remember the user role (valid for 5 hours)
            CookieUtil.addCookie(resp, "role", "user", 5 * 30);
            // Redirect to home page after successful login
            resp.sendRedirect(req.getContextPath() + "/home"); // Change to a valid servlet URL
        } else {
            // If credentials are invalid, set error message and forward to login page
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(req, resp);
        }
    }
}
