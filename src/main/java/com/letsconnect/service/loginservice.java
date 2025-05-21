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
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DbConfig.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            rs = stmt.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }


    public User getUserByUsername(String username) {
        String query = "SELECT id, first_name, last_name, email, phone, gender, username, province, city, role FROM users WHERE username = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DbConfig.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);

            rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setUsername(rs.getString("username"));
                user.setProvince(rs.getString("province"));
                user.setCity(rs.getString("city"));
                user.setRole(rs.getString("role"));
                return user;
            } else {
                System.out.println("User not found with username: " + username);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        return null;
    }

    // Updates user profile
    public boolean updateUser(User user) {
        String query;
        boolean updatePassword = user.getPassword() != null && !user.getPassword().isEmpty();
        Connection conn = null;
        PreparedStatement stmt = null;

        if (updatePassword) {
            query = "UPDATE users SET first_name = ?, last_name = ?, phone = ?, gender = ?, province = ?, city = ?, password = ? WHERE username = ?";
        } else {
            query = "UPDATE users SET first_name = ?, last_name = ?, phone = ?, gender = ?, province = ?, city = ? WHERE username = ?";
        }

        try {
            conn = DbConfig.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getGender());
            stmt.setString(5, user.getProvince());
            stmt.setString(6, user.getCity());

            if (updatePassword) {
                stmt.setString(7, user.getPassword());
                stmt.setString(8, user.getUsername());
            } else {
                stmt.setString(7, user.getUsername());
            }

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        return false;
    }
}
