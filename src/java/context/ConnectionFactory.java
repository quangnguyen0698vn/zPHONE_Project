package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	//static reference to itself
	private static ConnectionFactory instance = new ConnectionFactory();
	
	private final String serverName = "localhost";
	private final String databaseName = "ShoppingDB";
	private final String portNumber = "33060";
	private final String user = "root";
	private final String password ="!rootpassword";
	
	private String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + databaseName;
	private String driverClass = "com.mysql.cj.jdbc.Driver";
	
	//private constructor
    private ConnectionFactory() {
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static ConnectionFactory getInstance()   {
        return instance;
    }
     
    public Connection getConnection() throws SQLException, 
    ClassNotFoundException {
        Connection connection = 
            DriverManager.getConnection(url, user, password);
        return connection;
    }   
}

