package com.letsconnect.controller;

import com.letsconnect.model.Product;
import com.letsconnect.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig
@WebServlet("/UpdateProduct")
public class Updateproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService service;

	@Override
	public void init() {
		service = new ProductService();
	}

	private void setProductList(HttpServletRequest req) throws SQLException {
		List<Product> products = service.getAllProducts();
		req.setAttribute("products", products);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String productIdStr = req.getParameter("id");

		try {
			if (action != null && !action.isEmpty() && productIdStr != null) {
				int id = Integer.parseInt(productIdStr);

				if ("edit".equalsIgnoreCase(action)) {
					Product product = service.getProductById(id);
					if (product != null) {
						req.setAttribute("editProduct", product);
					} else {
						req.setAttribute("error", "Product not found with ID: " + id);
					}

				} else if ("delete".equalsIgnoreCase(action)) {
					boolean deleted = service.deleteProduct(id);
					req.setAttribute(deleted ? "message" : "error",
							deleted ? "Product deleted successfully!" : "Product could not be deleted.");
				}
			}

			setProductList(req);
			req.getRequestDispatcher("/WEB-INF/Pages/UpdateProduct.jsp").forward(req, resp);

		} catch (SQLException | NumberFormatException e) {
			req.setAttribute("error", "Error processing request: " + e.getMessage());
			e.printStackTrace();
			req.getRequestDispatcher("/WEB-INF/Pages/UpdateProduct.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");

		// Handle DELETE action if posted via form
		if ("delete".equalsIgnoreCase(action)) {
			int id = parseIntSafe(req.getParameter("productId"));
			boolean deleted = service.deleteProduct(id);
			resp.sendRedirect(
					req.getContextPath() + "/UpdateProduct?message=" + (deleted ? "deleted" : "delete_failed"));
			return;
		}

		// Handle ADD/EDIT
		try {
			int id = parseIntSafe(req.getParameter("productId"));
			String name = req.getParameter("product_name");
			String brand = req.getParameter("product_brand");
			String specs = req.getParameter("product_specifications");
			double price = parseDoubleSafe(req.getParameter("product_price"));

			if (price < 0) {
				req.setAttribute("error", "Invalid product price");
				setProductList(req);
				req.getRequestDispatcher("/WEB-INF/Pages/UpdateProduct.jsp").forward(req, resp);
				return;
			}

			Part imagePart = req.getPart("product_image");
			String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
			String imagePath = "";

			if (fileName != null && !fileName.isEmpty()) {
				imagePath = "images/" + fileName;
				File imageDir = new File(getServletContext().getRealPath("/") + "images");
				if (!imageDir.exists())
					imageDir.mkdir();

				String fullPath = getServletContext().getRealPath("/") + imagePath;
				imagePart.write(fullPath);
			} else if (id > 0) {
				Product existing = service.getProductById(id);
				if (existing != null) {
					imagePath = existing.getImagePath();
				} else {
					req.setAttribute("error", "Original product not found for image reuse.");
					setProductList(req);
					req.getRequestDispatcher("/WEB-INF/Pages/UpdateProduct.jsp").forward(req, resp);
					return;
				}
			} else {
				req.setAttribute("error", "Product image is required.");
				setProductList(req);
				req.getRequestDispatcher("/WEB-INF/Pages/UpdateProduct.jsp").forward(req, resp);
				return;
			}

			Product product = new Product(id, name, brand, price, specs, imagePath);
			boolean success = (id > 0) ? service.updateProduct(product) : service.addProduct(product);

			if (success) {
				resp.sendRedirect(req.getContextPath() + "/UpdateProduct?message=" + (id > 0 ? "updated" : "added"));
			} else {
				resp.sendRedirect(
						req.getContextPath() + "/UpdateProduct?error=" + (id > 0 ? "update_failed" : "add_failed"));
			}

		} catch (SQLException e) {
			req.setAttribute("error", "Database error: " + e.getMessage());
			e.printStackTrace();
			req.getRequestDispatcher("/WEB-INF/Pages/UpdateProduct.jsp").forward(req, resp);
		}
	}

	private int parseIntSafe(String param) {
		try {
			return param != null ? Integer.parseInt(param.trim()) : 0;
		} catch (NumberFormatException e) {
			return 0;
		}
	}

	private double parseDoubleSafe(String param) {
		try {
			return param != null ? Double.parseDouble(param.trim()) : -1;
		} catch (NumberFormatException e) {
			return -1;
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		resp.getWriter().write("PUT method is not supported.");
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int id = parseIntSafe(req.getParameter("productId"));
		boolean deleted = service.deleteProduct(id);
		resp.setStatus(deleted ? HttpServletResponse.SC_OK : HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		resp.getWriter().write(deleted ? "Product deleted successfully!" : "Failed to delete product.");
	}
}