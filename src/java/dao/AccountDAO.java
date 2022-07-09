package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import context.ConnectionFactory;
import model.Account;

public class AccountDAO {
	
	public boolean checkDuplicatedEmail(String email) {
		
		String sql = "SELECT COUNT(*) FROM Account a WHERE a.user_email = ?";
		try {
			Connection connection = ConnectionFactory.getInstance().getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				int count = resultSet.getInt(1);
				return count == 1;
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean createAccount(String email, String password, String name, String address, String phone) {
		String sql = "INSERT INTO Account(user_email, password, user_name, user_address, user_phone, account_role) VALUES(?, ?, ?, ?, ?, ?)";
		
		boolean ret = false;
		try {
			Connection connection = ConnectionFactory.getInstance().getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);
			statement.setString(3, name);
			statement.setString(4, address);
			statement.setString(5, phone);
			//role == 2 means it's a normal user
			statement.setInt(6, 2);
			ret = statement.execute();
			connection.close();
		}  catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public Account login(String email, String password) {
		String sql = "SELECT user_email, password, account_role, user_name, user_address, user_phone"
				+ " FROM Account a WHERE a.user_email = ? AND a.password = ?";
		Account account = null;
		Connection connection;
		try {
			connection = ConnectionFactory.getInstance().getConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				account = new Account();
				account.setEmail(resultSet.getString("user_email"));
				account.setPassword(resultSet.getString("password"));
				account.setRole(resultSet.getInt("account_role"));
				account.setName(resultSet.getString("user_name"));
				account.setAddress(resultSet.getString("user_address"));
				account.setPhone(resultSet.getString("user_phone"));
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return account;
	/*
	 * 
	 * `user_email` varchar(100) NOT NULL,
	`password` varchar(64) NOT NULL,
	`account_role` int NOT NULL,
	`user_name` varchar(50) NOT NULL,
	`user_address` varchar(255) NULL,
	`user_phone`
	 */
	}
}
