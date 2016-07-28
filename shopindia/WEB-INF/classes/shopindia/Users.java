package shopindia;
import java.sql.*;
public class Users 
{
	private String userId; 
	private String password;
	private DConnection db=new DConnection();
	public String getPassword()
	{
		return password;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void update(String userid, String password)
	{
			db.setdata("update users set password ='"+password+"' where userid='"+userid+"'");
			db.close();
	}
	public ResultSet display()
	{
			ResultSet rst=db.getdata("select * from users where usertype = 'customer' ");
			return rst;
	}
	public void delete(String userId)
	{
			db.setdata("delete from users where userid='"+userId+"'");
			db.close();
	}
	
}
