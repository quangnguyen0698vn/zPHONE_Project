package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.ConnectionFactory;
import context.DatabaseContext;
import model.Product;

public class ProductDAO {
	// List All
	public List<Product> getAllProducts() {
		
		String sqlStatement = " SELECT"
				+ "	p.product_id, p.product_name, p.product_des,"
				+ " p.product_price, p.product_img_source, p.product_type, p.product_brand"
				+ " FROM Product p";
		
		List<Product> ret = new ArrayList<>();
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sqlStatement);
			ResultSet resultSet = statement.executeQuery();
			ProductDAO.toList(resultSet, ret);
			connection.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return ret;
	}
	
	// for pagination
	public List<Product> getProducts(int start, int end) {
		String sqlStatement = "CALL GetProducts(?, ?)";
		List<Product> ret = new ArrayList<>();
		if (start > end) return ret;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sqlStatement);
			statement.setInt(1, start);
			statement.setInt(2, end);
			ResultSet resultSet = statement.executeQuery();
			ProductDAO.toList(resultSet, ret);
			connection.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	// for brand pagination
	public List<Product> getProductsWithBrand(int start, int end, String brand) {
		String sqlStatement = "CALL GetProductsWithBrand(?, ?, ?)";
		List<Product> ret = new ArrayList<>();
		if (start > end) return ret;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sqlStatement);
			statement.setInt(1, start);
			statement.setInt(2, end);
			statement.setString(3, brand);
			ResultSet resultSet = statement.executeQuery();
			ProductDAO.toList(resultSet, ret);
			connection.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public List<Product> searchProducts(int start, int end, String keyword) {
		String sqlStatement = "CALL SearchProducts(?, ?, ?)";
		List<Product> ret = new ArrayList<>();
		if (start > end) return ret;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sqlStatement);
			statement.setInt(1, start);
			statement.setInt(2, end);
			statement.setString(3, keyword);
			ResultSet resultSet = statement.executeQuery();
			ProductDAO.toList(resultSet, ret);
			connection.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public List<Product> searchProductsWithBrand(int start, int end, String keyword, String category) {
		String sqlStatement = "CALL SearchProductsWithBrand(?, ?, ?, ?)";
		List<Product> ret = new ArrayList<>();
		if (start > end) return ret;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sqlStatement);
			statement.setInt(1, start);
			statement.setInt(2, end);
			statement.setString(3, keyword);
			statement.setString(4, category);
			ResultSet resultSet = statement.executeQuery();
			ProductDAO.toList(resultSet, ret);
			connection.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public static Product nextProductRow(ResultSet resultSet) throws SQLException {
		int id = resultSet.getInt("product_id");
		String name = resultSet.getString("product_name");
		String description = resultSet.getString("product_des");
		double price = resultSet.getDouble("product_price");
		String src = resultSet.getString("product_img_source");
		String type = resultSet.getString("product_type");
		String brand = resultSet.getString("product_brand");
		return new Product(id, name, description, price, src, type, brand);
	}

	public static void toList(ResultSet resultSet, List<Product> ret) {
		try {
			while (resultSet.next()) {
				ret.add(nextProductRow(resultSet));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getNumberOfRecords() {
		String sqlStatement = "SELECT COUNT(*) as count FROM Product";
		int ret = 0;
		try {
			Connection connection = ConnectionFactory.getInstance().getConnection();
			PreparedStatement statement = connection.prepareStatement(sqlStatement);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) ret = resultSet.getInt("count");
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public int getNumberOfRecordsWithBrand(String categoryStr) {
		String sql = "SELECT COUNT(*) as count FROM Product p WHERE p.product_brand = ?";
		int ret = 0;
		try {
			Connection connection = ConnectionFactory.getInstance().getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, categoryStr);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) ret = resultSet.getInt("count");
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public int getSearchResultSize(String keyword) {
		String sql = "SELECT COUNT(*) as count FROM Product p WHERE p.product_name like CONCAT('%',?,'%')";
		int ret = 0;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, keyword);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) ret = resultSet.getInt("count");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public int getSearchWithBrandResultSize(String keyword, String category) {
		String sql = "SELECT COUNT(*) as count FROM Product p WHERE p.product_name like concat('%',?,'%') AND p.product_brand = ?";
		int ret = 0;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, keyword);
			statement.setString(2, category);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) ret = resultSet.getInt("count");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}

	public Product getProduct(int id) {
		String sql = " SELECT"
				+ "	p.product_id, p.product_name, p.product_des,"
				+ " p.product_price, p.product_img_source, p.product_type, p.product_brand"
				+ " FROM Product p"
				+ " WHERE p.product_id = ?";
		Product ret = null;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				ret = nextProductRow(resultSet);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
}
