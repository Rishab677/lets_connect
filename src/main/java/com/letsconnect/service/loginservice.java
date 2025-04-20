package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.letsconnect.model.User;
import com.letsconnect.configure.DbConfig;

public class loginservice {

    // Checks if the user's credentials match what's stored in the database
    public boolean loginUser(User user) {
        // Correct SQL query with parameterized placeholders for username and password
        String query = "SELECT password FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DbConfig.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set the values for the placeholders
            stmt.setString(1, user.getUsername());  // Set the username
            stmt.setString(2, user.getPassword());  // Set the password

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");  // Retrieve the password from the DB
                // Debugging: Output retrieved password and input password
                System.out.println("DB Password: " + dbPassword);
                System.out.println("Input Password: " + user.getPassword());

                // Direct password comparison (Plaintext comparison)
                return dbPassword.equals(user.getPassword());
            } else {
                return false; // No user found with the given username or incorrect password
            }

        } catch (Exception e) {
            // Log the error (use a logger instead of printStackTrace in production)
            e.printStackTrace();
            return false; // Treat exception as login failure
        }
    }
}
