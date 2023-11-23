package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class config {

	private static final String USERNAME = "root";
//	private static final String PASSWORD = "";
	private static final String PASSWORD = "123456789";
	private static final String DATABASE = "hotel";
	private static final String HOST = "localhost";

	public Connection getConnection() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://" + HOST + "/" + DATABASE;
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(url, USERNAME, PASSWORD);
	}

}