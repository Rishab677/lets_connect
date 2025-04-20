package com.letsconnect.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.InputStream;

import com.letsconnect.configure.DbConfig;
import com.letsconnect.model.User;

public class RegisterService {

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

            InputStream profilePhoto = users.getProfilePhoto();
            if (profilePhoto != null) {
                stmt.setBlob(10, profilePhoto);
            } else {
                stmt.setNull(10, java.sql.Types.BLOB);
            }

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
