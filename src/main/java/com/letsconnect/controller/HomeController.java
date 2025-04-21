package com.letsconnect.controller;

import java.io.IOException;
import com.letsconnect.model.User;
import com.letsconnect.service.loginservice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/home", "/"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Initialize loginService to handle business logic
    private final loginservice loginService = new loginservice();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get username from session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Fetch user details from database to display on home page (optional)
        User user = loginService.getUserByUsername(username);
        request.setAttribute("user", user);

        // Forward to home page (home.jsp)
        request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
    }
}