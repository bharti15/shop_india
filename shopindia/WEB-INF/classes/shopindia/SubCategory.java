package shopindia;
import java.sql.*;
public class SubCategory 
{
	private int subCatId; 
	private int catId;
	private String catName;
	private String subCatName;
	private DConnection db=new DConnection();
	public void add(int catId,String subCatName)
	{
		try
		{
			ResultSet rst=db.getdata("select max(subcat_id) from subcategory");
			if(rst.next())
				subCatId=rst.getInt(1);
			db.close();			
			subCatId++;
			db.setdata("insert into subcategory values("+subCatId+","+catId+",'"+subCatName+"')");
			db.close();
		}
		catch(SQLException e)
		{
			
		}
	}
	public void update(int subCatId, String newSubCatName,int newCatId)
	{
			db.setdata("update subcategory set subcat_name='"+newSubCatName+"' , cat_id="+newCatId+" where subCat_id="+subCatId);
			db.close();
	}
	public ResultSet display()
	{
			ResultSet rst=db.getdata

("select * from subcategory order by cat_id");
			return rst;
	}
	public void delete(int subCatId)
	{
			db.setdata("delete from subcategory where subcat_id="+subCatId);
			db.close();
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
	public ResultSet getAllCatName()
	{
		ResultSet rst;
		rst=db.getdata("select * from category");
		return rst;
	}

}
