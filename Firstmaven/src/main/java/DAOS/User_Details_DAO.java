package DAOS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User_Details_DAO 
{
	static ResultSet rs;
	static Connection con;
	static PreparedStatement ps;
	

	public static boolean Add_User_Details(String Name,String Email,String Address, long Contact, String Password)
	{
		try
		{
			ps=Connectivity_DAO.con.prepareStatement("insert into user_details(Name,Email,Address,Contact,Password) values(?,?,?,?,?)");
			ps.setString(1, Name);
			ps.setString(2, Email);
			ps.setString(3, Address);
			ps.setLong(4, Contact);
			ps.setString(5, Password);
			return ps.executeUpdate()>0;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static ResultSet List_User_Details()
	{
		try
		{
		rs=Connectivity_DAO.con.createStatement().executeQuery("select * from User_Details");
		return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}



