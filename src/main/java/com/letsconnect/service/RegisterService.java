package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.letsconnect.configure.DbConfig;
import com.letsconnect.model.User;

public class RegisterService {

    // Method to register a user
    public boolean registerUser(User users) {
        String sql = "INSERT INTO users (first_name, last_name, email, phone, gender, username, province, city, password, profile_photo) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, users.getFirstName());
            stmt.setString(2, users.getLastName());
            stmt.setString(3, users.getEmail());
            stmt.setString(4, users.getPhone());
            stmt.setString(5, users.getGender());
            stmt.setString(6, users.getUsername());
            stmt.setString(7, users.getProvince());
            stmt.setString(8, users.getCity());
            stmt.setString(9, users.getPassword());

            String profilePhotoPath = users.getProfilePhoto();
            if (profilePhotoPath != null && !profilePhotoPath.isEmpty()) {
                stmt.setString(10, profilePhotoPath);
            } else {
                stmt.setNull(10, java.sql.Types.VARCHAR);
            }

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to check if user exists by username or email
    public boolean userExists(String username, String email) {
        String sql = "SELECT id FROM users WHERE username = ? OR email = ?";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, email);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // true if at least one result is found
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return true; // safer to assume it exists if there's an error
        }
    }

    // Method to get the profile image URL by username
    public String getImageUrlByUsername(String username) {
        String query = "SELECT profile_photo FROM users WHERE username = ?";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("profile_photo");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "resources/image/profile/default_profile.png"; // Return default image if not found
    }
}
