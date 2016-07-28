package shopindia;
import java.sql.*;
public class DOrder 
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
	
	public ResultSet display()
	{
			ResultSet rst=db.getdata(" select * from dorders ");
			//db.close();
			return rst;
	}
}
