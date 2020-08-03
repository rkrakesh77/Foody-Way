package DAOS;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Resturant_Food_DAO
{
	static PreparedStatement ps;
	static ResultSet rs;

	public static boolean Add_Resturant_Food(int Resturant_Id,String Category,int Category_Id, String Food_Item, double Price,String Description)
	{
		try
		{
			ps=Connectivity_DAO.con.prepareStatement("insert into resturant_food(Resturant_Id,Category,Category_Id,Food_Item,Price,Description) values(?,?,?,?,?,?)");
			ps.setInt(1, Resturant_Id);
			ps.setString(2, Category);
			ps.setInt(3, Category_Id);
			ps.setString(4, Food_Item);
			ps.setDouble(5, Price);
			ps.setString(6, Description);
			return ps.executeUpdate()>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean Delete_Resturant_Food(int Resturant_Id)
	{
		try
		{
		ps=Connectivity_DAO.con.prepareStatement("delete from resturant_food where Resturant_Id="+Resturant_Id);
		return ps.executeUpdate()>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return false;
	}
	
	public static ResultSet List_Resturant_Food()
	{
		try
		{
		rs=Connectivity_DAO.con.createStatement().executeQuery("select * from Resturant_food");
		return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet List_Resturant_Food_Id(int Resturant_Id)
	{
		try
		{
		rs=Connectivity_DAO.con.createStatement().executeQuery("select * from Resturant_food where Resturant_Id="+Resturant_Id+" order by Category");
		return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet List_Resturant_Food_CategoryId(int Category_Id)
	{
		try
		{
		rs=Connectivity_DAO.con.createStatement().executeQuery("select * from Resturant_food where Category_Id="+Category_Id);
		return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet List_Resturant_Food_resCategoryId(int Resturant_Id, int Category_Id)
	{
		try
		{
		rs=Connectivity_DAO.con.createStatement().executeQuery("select * from Resturant_food where Resturant_Id='"+Resturant_Id+"' and Category_Id='"+Category_Id+"'");
		return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean Add_Food(String Id, String Food_Name,int Price, int Resturant_Id)
	{
		try
		{
		
			ps=DAOS.Connectivity_DAO.con.prepareStatement("insert into user_cart (Id,Food_Name,Price,Resturant_Id) values(?,?,?,?)");
			ps.setString(1, Id);
			ps.setString(2, Food_Name);
			ps.setInt(3, Price);
			ps.setInt(4, Resturant_Id);
			return ps.executeUpdate()>0;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static ResultSet List_Food(String Cart_Id)
	{
		try
		{
		rs=Connectivity_DAO.con.createStatement().executeQuery("select * from user_cart where Id='"+Cart_Id+"';" );
		return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean Delete_Cart_Food(String Id)
	{
		try
		{
		ps=Connectivity_DAO.con.prepareStatement("delete from user_cart where Id='"+Id+"';");
		return ps.executeUpdate()>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return false;
	}
}










