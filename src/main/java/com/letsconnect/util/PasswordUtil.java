package com.letsconnect.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {
    private static final String ALGO = "SHA-256"; // SHA-256 is used for password hashing

    // Hashes the raw password chars to a hex string (SHA-256)
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance(ALGO);
            byte[] digest = md.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString(); // Return the hashed password
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 algorithm not available", e);
        }
    }

    // Verifies raw password against stored hash
    public static boolean verifyPassword(String rawPassword, String storedHash) {
        return storedHash != null && storedHash.equals(hashPassword(rawPassword));
    }
}
