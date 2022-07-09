package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import context.ConnectionFactory;
import model.Cart;
import model.Order;
import model.Product;

public class OrderDAO {
	
	public void placeOrder(Order order, Cart cart) {
		int orderId = insertNewOrder(order);
		insertOrderDetail(orderId, cart);
	}

	private void insertOrderDetail(int orderId, Cart cart) {
		for(Product item : cart.getItems()) {
			String sql = "INSERT INTO OrderDetail(order_id, product_id, product_quantity, unit_price)"
					+ " VALUES(?, ?, ?, ?)";
			try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
				PreparedStatement statement = connection.prepareStatement(sql);
				statement.setInt(1, orderId);
				statement.setInt(2, item.getId());
				statement.setInt(3,  item.getNumber());
				statement.setDouble(4, item.getPrice());
				statement.executeUpdate();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	private int insertNewOrder(Order order) {
		String sql = "INSERT INTO `Order`(user_email, order_discount_code, order_address)"
				+ " VALUES(?,?,?)";
		int ret = -1;
		try (Connection connection = ConnectionFactory.getInstance().getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, order.getUserEmail());
			statement.setString(2, order.getDiscountCode());
			statement.setString(3, order.getAddress());
			statement.execute();
			ResultSet resultSet = statement.getGeneratedKeys();
			if (resultSet.next()) {
				ret = resultSet.getInt(1);
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
}
