package shopindia;
import java.sql.*;
public class Items 
{
	private int subCatId; 
	private int catId;
	private int itemId;
	private String itemName;
	private DConnection db=new DConnection();
	public void add(int catId,int subCatId ,String itemName,int price,String image,String details)
	{
		try
		{
			ResultSet rst=db.getdata("select max(item_id) from items");
			if(rst.next())
				itemId=rst.getInt(1);
			db.close();			
			itemId++;
			db.setdata("insert into items values("+itemId+","+catId+","+subCatId+",'"+itemName+"',"+price+",'"+image+"',0,'"+details+"')");
			db.close();
		}
		catch(SQLException e)
		{
			
		}
	}
	public void update(int itemId, String newItemName,int newCatId,int newSubCatId,int newPrice,String newDetails)
	{
			db.setdata("update items set item_name='"+newItemName+"' , cat_id="+newCatId+", subcat_id="+newSubCatId+", price="+newPrice+", details='"+newDetails+"' where item_id="+itemId);
			db.close();
	}
	public ResultSet display()
	{
			ResultSet rst=db.getdata

("select * from items order by cat_id,subcat_id");
			return rst;
	}
	public void delete(int itemId)
	{
			db.setdata("delete from items where item_id="+itemId);
			db.close();
	}
	public String getItemName(int itemId)
	{
		String s1="";
		try
		{
			ResultSet rst=db.getdata("select item_name from items where item_id="+itemId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;		
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
			
		}
		return s1;
	}
	public ResultSet getAllItemName()
	{
		ResultSet rst;
		rst=db.getdata("select * from items");
		return rst;
	}
	public ResultSet getAllCatName()
	{
		ResultSet rst;
		rst=db.getdata("select * from category");
		return rst;
	}
	public ResultSet getAllSubCatName()
	{
		ResultSet rst;
		rst=db.getdata("select * from subcategory");
		return rst;
	}

}
