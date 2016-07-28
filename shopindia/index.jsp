<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop India</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>

<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
   <div class="cl">&nbsp;</div>
    <!-- Sidebar -->
    <div id="sidebar">
	<%@ include file="left.jsp" %>
    </div>
    <!-- End Sidebar -->
    
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="box">
	<%@ include file="slider.jsp" %>
      </div>
      <!-- End Content Slider -->
      <!-- Products -->
      <div class="products">
<h1>Products</h1>
<table border="1">	
	<tr>
<%
	int i=0;
	int max=0,min=0;
	
	
	try
	{
		
		
		
		if(price!=null && !"".equals(price) && !price.equalsIgnoreCase("All") )
		{
			String s[]=price.split(" ");
			min=Integer.parseInt(s[1]);
			max=0;
			if(s[3].equals("above"))
				max=Integer.MAX_VALUE;
			else
				max=Integer.parseInt(s[3]);
		}
String qq="";
		if((cat==null || cat.length==0) && (subcat==null || subcat.length==0))
{
 qq="select * from items where ('"+item+"'='null' or '"+item+"'='' or item_name='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))";
log(qq);
rst=db.getdata(qq);
}
			
		else if(subcat==null || subcat.length==0)
			rst=db.getdata("select * from items where cat_id in"+catstr + " and ('"+item+"'='null' or '"+item+"'='' or item_name='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");
		else if(cat==null || cat.length==0)
			rst=db.getdata("select * from items where subcat_id in"+subcatstr + " and ('"+item+"'='null' or '"+item+"'='' or item_name='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");
		else
			rst=db.getdata("select * from items where cat_id in"+catstr + "and subcat_id in"+subcatstr + " and ('"+item+"'='null' or '"+item+"'='' or item_name='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");
		while(rst.next())
		{
			if(rst.getInt(7)!= 0)
			{
			out.print("<td><form action='addcart.jsp?id="+rst.getInt(1)+"' method='post'>"+rst.getString(4)+"<br /><a href='details.jsp?id="+rst.getInt(1)+"'><img src='itemimages/"+rst.getString(6)+"' width='176' height='170' /></a><br />Rs."+rst.getInt(5)+"/-<br /><input type='submit' value='Add To Cart' /></form></td>");
			i++;
				if(i%4==0)
				{
				out.print("</tr><tr>");
				}
			}
			else
			{
				out.print("<td>"+rst.getString(4)+"<br /><a href='details.jsp?id="+rst.getInt(1)+"'><img src='itemimages/"+rst.getString(6)+"' width='100' height='100' /></a><br />Rs."+rst.getInt(5)+"/-<br /> <lable> out of stock </lable> </td>");		
				
			}
		
		}
		out.print("</tr>");
		
	}
	catch(SQLException e)
	{
		out.print(e);
	}

%>		
</table>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
    </div>
    <!-- End Content -->
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <%@ include file="footer.jsp" %>
</div>
<!-- End Shell -->
</body>
</html>
