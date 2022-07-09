package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Deprecated
public class DatabaseContext {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + databaseName;
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, user, password);
	}
	
	private final String serverName = "localhost";
	private final String databaseName = "ShoppingDB";
	private final String portNumber = "33060";
	private final String user = "root";
	private final String password ="!rootpassword";
	
}
