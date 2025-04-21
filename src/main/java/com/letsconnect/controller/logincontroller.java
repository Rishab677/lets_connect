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
            req.setAttribute("error", "Please fill in both username and password.");
            req.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(req, resp);
            req.getRequestDispatcher("/WEB-INF/Pages/Profile.jsp").forward(req, resp);
            return;
        }

        // Trim any leading/trailing spaces
        username = username.trim();
        password = password.trim();

        // Create a User object with submitted credentials
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        // Validate user login
        boolean isValidUser = loginService.loginUser(user);

        if (isValidUser) {
            // Fetch complete user details including role
            User fullUser = loginService.getUserByUsername(username);
            String role = fullUser.getRole();

            // Store username and role in session
            SessionUtil.setAttribute(req, "username", username);
            SessionUtil.setAttribute(req, "role", role);

            // Add role cookie (optional)
            CookieUtil.addCookie(resp, "role", role, 5 * 30); // 5 * 30 = 150 minutes

            // Redirect based on role
            if ("admin".equalsIgnoreCase(role)) {
            	   req.getRequestDispatcher("/WEB-INF/Pages/Admin.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }

        } else {
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(req, resp);
        }
    }
}