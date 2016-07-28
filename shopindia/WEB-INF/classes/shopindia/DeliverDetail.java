package shopindia;
import java.sql.*;
public class DeliverDetail 
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
	
	public ResultSet display(int id)
	{
			ResultSet rst=db.getdata(" select * from dorders_det where order_id = "+id);
			//db.close();
			return rst;
	}
}
