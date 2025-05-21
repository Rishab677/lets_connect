package com.letsconnect.controller;

import com.letsconnect.model.User;
import com.letsconnect.service.loginservice;
import com.letsconnect.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final loginservice loginService = new loginservice();
    private static final Logger logger = Logger.getLogger(ProfileController.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = (String) SessionUtil.getAttribute(req, "username");

        if (username == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = loginService.getUserByUsername(username);

        if (user != null) {
            req.setAttribute("user", user);
            req.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

     
        if (newPassword != null && !newPassword.isEmpty()) {
            if (!newPassword.equals(confirmPassword)) {
                req.setAttribute("error", "Passwords do not match.");
                doGet(req, resp);  
                return;
            }
        }

        
        User user = loginService.getUserByUsername(username);
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Update the values
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        user.setGender(gender);
        user.setProvince(province);
        user.setCity(city);
        if (newPassword != null && !newPassword.isEmpty()) {
            user.setPassword(newPassword);  
        }

        // Save updated user
        boolean success = loginService.updateUser(user);

        if (success) {
            logger.info("User updated successfully: " + username);
            req.setAttribute("user", user);
            req.setAttribute("success", "Profile updated successfully.");
        } else {
            logger.warning("Failed to update user: " + username);
            req.setAttribute("error", "Failed to update profile.");
        }

        doGet(req, resp);  // Reload updated profile page
    }
}