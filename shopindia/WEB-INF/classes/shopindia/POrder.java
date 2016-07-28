package shopindia;
import java.sql.*;
public class POrder 
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
	public void update(String id, String name,String amount)
	{
		db.setdata("insert into dorders values('"+ id+"','"+name+"','"+amount+"')");	
		db.close();
	}
	public void update1(int id)
	{
		try
		{
			ResultSet  rst=db.getdata("select count(*) from porders_det  where order_id ="+id);
			rst.next();
			int cnt=rst.getInt(1);
			db.close();
			rst=db.getdata("select * from porders_det  where order_id ="+id);
			rst.next();
			int t[][]=new int[cnt][5];
			for(int i=0;i<cnt;i++)
			{
				for(int j=0;j<5;j++)
					t[i][j]=rst.getInt(j+1);
				rst.next();
			}
			db.close();
			for(int i=0;i<cnt;i++)
			{
				db.setdata("insert into dorders_det values("+t[i][0]+","+t[i][1]+","+t[i][2]+","+t[i][3]+","+t[i][4]+")");	
			}
			db.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();	
		}
	} 
	public ResultSet display()
	{
			ResultSet rst=db.getdata(" select * from porders ");
			//db.close();
			return rst;
	}
	public void delete(int id)
	{
			db.setdata("delete from porders where order_id=" +id);
			db.close();
	}
	public void del(int id)
	{
			db.setdata("delete from porders_det where order_id=" +id);
			db.close();
	}
}
