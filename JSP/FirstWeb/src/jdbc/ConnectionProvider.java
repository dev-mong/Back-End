package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionProvider {

	
	public static Connection getConnection() throws SQLException {
	
		String jdbcUrl="jdbc:apache:commoms:dbcp:pool";
		
		//DB Connection 정보 
		//String dbUrl="jdbc:oracle:thin:@localhost:1522:orcl";
		//String user="scott";
		//String pw="tiger";
		
		//return DriverManager.getConnection(dbUrl,user,pw);
	
		return DriverManager.getConnection(jdbcUrl);
	}
	
	
}
