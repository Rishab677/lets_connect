package com.letsconnect.util;

import javax.crypto.Cipher;

import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class PasswordUtil {

    private static final String SECRET_KEY = "your-secret-key"; // Ideally, this should be more securely managed

    /**
     * Decrypts the given encrypted password using AES decryption.
     *
     * @param encryptedPassword the encrypted password
     * @param username the username (can be used as a salt or key modifier)
     * @return the decrypted password, or null if decryption fails
     */
    public static String decrypt(String encryptedPassword, String username) {
        try {
            // Here we are simply using the username to create a SecretKeySpec.
            // You might need a better approach depending on your encryption strategy.
            SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedPassword));
            return new String(decryptedBytes); // Return the decrypted password
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Return null if an error occurs during decryption
        }
    }
}
