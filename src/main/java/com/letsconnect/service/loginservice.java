package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.letsconnect.model.User;
import com.letsconnect.configure.DbConfig;

public class loginservice {

    // Validates user credentials
    public boolean loginUser(User user) {
        String query = "SELECT password FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DbConfig.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            ResultSet rs = stmt.executeQuery();

            return rs.next(); // Returns true if user exists with matching password

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Fetches full user info (including role) after successful login
    public User getUserByUsername(String username) {
        String query = "SELECT username, password, role FROM users WHERE username = ?";

        try (Connection conn = DbConfig.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Return null if not found or error
    }
}