package com.letsconnect.service;

import com.letsconnect.model.Product;
import com.letsconnect.model.Cart;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.ArrayList;
import java.util.List;

public class ProductService {

	private static final String DB_URL = "jdbc:mysql://localhost:3316/lets_connect";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "";

	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC Driver not found.");
			throw new SQLException("JDBC Driver not found", e);
		}
		return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	}

	public boolean addProduct(Product product) throws SQLException {
		if (product == null)
			return false;

		String sql = "INSERT INTO product (product_name, product_brand, product_price, product_specifications, product_image) VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, product.getProduct_name());
			ps.setString(2, product.getBrand());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getSpecifications());
			ps.setString(5, product.getImagePath());

			return ps.executeUpdate() > 0;
		}
	}

	public List<Product> getAllProducts() throws SQLException {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT * FROM product";

		try (Connection conn = getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Product product = new Product(rs.getInt("ProductID"), rs.getString("product_name"),
						rs.getString("product_brand"), rs.getDouble("product_price"),
						rs.getString("product_specifications"), rs.getString("product_image"));
				products.add(product);
			}
		}
		return products;
	}

	public Product getProductById(int productId) throws SQLException {
		String sql = "SELECT * FROM product WHERE ProductID = ?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, productId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Product(rs.getInt("ProductID"), rs.getString("product_name"),
							rs.getString("product_brand"), rs.getDouble("product_price"),
							rs.getString("product_specifications"), rs.getString("product_image"));
				}
			}
		}
		return null;
	}

	public boolean updateProduct(Product product) throws SQLException {
		if (product == null || product.getId() <= 0)
			return false;

		String sql = "UPDATE product SET product_name = ?, product_brand = ?, product_price = ?, product_specifications = ?, product_image = ? WHERE ProductID = ?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, product.getProduct_name());
			ps.setString(2, product.getBrand());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getSpecifications());
			ps.setString(5, product.getImagePath());
			ps.setInt(6, product.getId());

			return ps.executeUpdate() > 0;
		}
	}

	public boolean deleteProduct(int id) {
	    boolean deleted = false;
	    String sql = "DELETE FROM product WHERE ProductID = ?";
	    try (Connection con = getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, id);
	        deleted = ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return deleted;
	}

	public boolean productExists(int productId) throws SQLException {
		String sql = "SELECT 1 FROM product WHERE ProductID = ?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, productId);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next();
			}
		}
	}

	public List<Product> searchProducts(String searchTerm) throws SQLException {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT * FROM product WHERE product_name LIKE ? OR product_brand LIKE ?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			String pattern = "%" + searchTerm + "%";
			ps.setString(1, pattern);
			ps.setString(2, pattern);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Product product = new Product(rs.getInt("ProductID"), rs.getString("product_name"),
							rs.getString("product_brand"), rs.getDouble("product_price"),
							rs.getString("product_specifications"), rs.getString("product_image"));
					products.add(product);
				}
			}
		}
		return products;
	}

	public List<Cart> addToCart(List<Cart> cart, int productId) throws SQLException {
		Product product = getProductById(productId);

		if (product != null) {
			boolean found = false;
			for (Cart item : cart) {
				if (item.getProduct().getId() == productId) {
					item.setQuantity(item.getQuantity() + 1);
					found = true;
					break;
				}
			}

			if (!found) {
				cart.add(new Cart(product, 1));
			}
		}
		return cart;
	}

	public List<Cart> removeFromCart(List<Cart> cart, int productId) {
		if (cart == null)
			return null;

		for (int i = 0; i < cart.size(); i++) {
			Cart item = cart.get(i);
			if (item.getProduct().getId() == productId) {
				if (item.getQuantity() > 1) {
					item.setQuantity(item.getQuantity() - 1);
				} else {
					cart.remove(i);
				}
				break;
			}
		}
		return cart;
	}
}