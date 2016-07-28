package shopindia;
import java.sql.*;
public class Stock {
	
	private DConnection db=new DConnection();
	
	public void update(int itemId, int stock)
	{
			db.setdata("update items set stock="+stock+" where item_id="+itemId);
			db.close();
	}
	
	public ResultSet display()
	{
			ResultSet rst=db.getdata("select * from items order by cat_id,subcat_id");
			return rst;
	}
	
	public String getCatName(int catId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.getdata("select cat_name from category where cat_id="+catId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return s1;	
	}
	
	public String getSubCatName(int subCatId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.getdata("select subcat_name from subcategory where subcat_id="+subCatId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return s1;
	}

}
