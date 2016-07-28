package shopindia;
import java.sql.*;
public class Category 
{
	private int catId; 
	private String catName;
	private DConnection db=new DConnection();
	public void setCatName(String catName)
	{
		this.catName=catName;
	}
	public String getCatName()
	{
		return catName;
	}
	public void add(String catName)
	{
		try
		{
			ResultSet rst=db.getdata

("select max(cat_id) from category");
			if(rst.next())
				catId=rst.getInt(1);
			db.close();			
			catId++;
			db.setdata("insert into category values("+catId+",'"+catName+"')");
			db.close();
		}
		catch(SQLException e)
		{
			
		}
	}
	public void update(int catId, String 

newCatName)
	{
			db.setdata("update category set cat_name='"+newCatName+"' where cat_id="+catId);
			db.close();
	}
	public ResultSet display()
	{
			ResultSet rst=db.getdata

("select * from category");
			return rst;
	}
	public void delete(int catId)
	{
			db.setdata("delete from category where cat_id="+catId);
			db.close();
	}
}
