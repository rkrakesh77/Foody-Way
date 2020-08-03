package DAOS;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connectivity_DAO 
{
	static Connection con;
	
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:Mysql://localhost/online_food","root","");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
