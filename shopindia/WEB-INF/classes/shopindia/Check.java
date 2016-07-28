package shopindia;
import java.sql.*;
public class Check 
{
	private String  user; 
	private String  pass;
	private String email;
	private String contact;
	private String address;
	private DConnection db=new DConnection();
	public void add(String user,String pass,String email,String contact,String address)
	{
		db.setdata("insert into users values('"+user+"','"+pass+"','customer','"+email+"','"+contact+"','"+address+"')");
		db.close();
	}
	public ResultSet getAllName()
	{
		ResultSet rst=db.getdata("select * from  users");
		return rst;
	}
}
