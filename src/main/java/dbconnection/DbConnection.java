package dbconnection;

import java.sql.*;

public class DbConnection {
	
	
	private static Connection con=null;
	private static String user="root"; 
	//private static String password="genr@&y&123";
	private static String password="genr@&y&123";
	

	//private static String url="jdbc:mysql://5.189.146.57:3306/bobble?autoReconnect=true&serverTimezone=UTC";
	
    private static String url = "jdbc:mysql://5.189.146.57:3306/bobble?autoReconnect=true&serverTimezone=UTC&useSSL=false";
	
	public Connection getDatabaseCoonection()
	{
		try {
			System.out.println("Db connecting-----");
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			con=DriverManager.getConnection(url,user,password);
			
			System.out.println("Db Connected ===========>");
			
		} 
		
		catch (Exception e)
		    {
                e.printStackTrace();
              
            }
	return con;
		
	}

}
