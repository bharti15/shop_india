package shopindia;
import java.sql.*;
public class DConnection 
{
	Connection conn;
	Statement stmt;
	ResultSet rst;
	public DConnection()
	{
		setdata("create table if not exists users(userid char(10), password char(10), usertype enum('admin','customer'), email varchar(40), contact varchar(40) ,address varchar(60) )");
		close();
		int cnt=0;
		try
		{
			rst=getdata("select count(*) from users");
			rst.next();
			cnt=rst.getInt(1);
			close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		if(cnt==0)
		{
			setdata("insert into users values('admin','admin','admin','','','')");
			close();
		}
		setdata("create table if not exists category(cat_id int primary key, cat_name char(20))");
		close();
		setdata("create table if not exists subcategory(subcat_id int primary key, cat_id int ,subcat_name char(20))");
		close();
		setdata("create table if not exists items(item_id int primary key, cat_id int ,subcat_id int,item_name char(20),price int,image char(20),stock int default 0, details char(255))");
		close();
		setdata("create table if not exists porders(order_id int primary key auto_increment, user char(10) , amount int)");
		close();
		setdata("create table if not exists porders_det(order_id int , item_id int ,qty int, price int, amount int)");
		close();
		setdata("create table if not exists dorders(order_id int primary key, user char(10) , amount int)");
		close();
		setdata("create table if not exists dorders_det(order_id int, item_id int ,qty int, price int, amount int)");
		close();
		setdata("create table if not exists inbox(mail_id varchar(40),query varchar(255),id int primary key,response varchar(200))");
		close();
	}
	public int setdata(String 

qry)//insert,delete,update
	{
		int cnt=0;
		try
		{
			Class.forName

("com.mysql.jdbc.Driver");
			

conn=DriverManager.getConnection

("jdbc:mysql://localhost:3306/shopindia","root","");
			stmt=conn.createStatement();
			cnt=stmt.executeUpdate(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public ResultSet getdata(String qry)//select
	{
		try
		{
			Class.forName

("com.mysql.jdbc.Driver");
			

conn=DriverManager.getConnection

("jdbc:mysql://localhost:3306/shopindia","root","");
			stmt=conn.createStatement();
			rst=stmt.executeQuery(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}		
		return rst;
	}
	public void close()
	{
		try
		{
			stmt.close();
			conn.close();
		}
		catch(SQLException e)
		{
			
		}
	}
}
