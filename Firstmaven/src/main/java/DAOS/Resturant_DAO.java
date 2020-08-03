package DAOS;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Resturant_DAO
{
	static Connection con;
	static PreparedStatement ps;
	static ResultSet rs;
	static Statement st;

	public static boolean Add_Resturant(String Name,String Email,String Address,long Contact, String Password,InputStream Photo, int Deal_Start_At)
	{
		try
		{
			ps=Connectivity_DAO.con.prepareStatement("insert into resturants (Name, Email, Address, Contact, Password,Photo,Deal_Start_At) values(?,?,?,?,?,?,?)");
			
			ps.setString(1, Name);
			ps.setString(2, Email);
			ps.setString(3, Address);
			ps.setLong(4, Contact);
			ps.setString(5, Password);
			ps.setBlob(6, Photo);
			ps.setInt(7, Deal_Start_At);
			return ps.executeUpdate()>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean Delete_Resturant(int Resturant_Id)
	{
		try
		{
		ps=Connectivity_DAO.con.prepareStatement("delete from resturants where Resturant_Id="+Resturant_Id);
		return ps.executeUpdate()>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return false;
	}
	
	public static ResultSet List_Resturant()
	{
		try
		{
			rs=Connectivity_DAO.con.createStatement().executeQuery("select *from Resturants");
			return rs;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static ResultSet List_Resturant_Logo( int Resturant_Id)
	{
		try
		{
			rs=Connectivity_DAO.con.createStatement().executeQuery("select *from Resturants where Resturant_Id="+Resturant_Id);
			return rs;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
