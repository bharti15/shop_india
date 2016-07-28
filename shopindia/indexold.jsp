<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop India</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>
<%
	shopindia.DConnection db=new shopindia.DConnection();
	String item=request.getParameter("item");
	if(item!=null)
		item=item.trim();
	String price=request.getParameter("price");
	if(price==null || price.equals(""))
		price="All";
	ResultSet rst=null;
	String catstr="",subcatstr="";
	String cat[]=request.getParameterValues("category");
	String subcat[]=request.getParameterValues("subcategory");
	if(cat!=null && cat.length!=0)
	{
		catstr="(";
		for(int i=0;i<cat.length;i++)
		catstr+=(cat[i]+",");
		catstr=catstr.substring(0,catstr.length()-1);
		catstr+=")";
	}
	if(subcat!=null && subcat.length!=0)
	{
		subcatstr="(";
		for(int i=0;i<subcat.length;i++)
			subcatstr+=(subcat[i]+",");
		subcatstr=subcatstr.substring(0,subcatstr.length()-1);
		subcatstr+=")";
	}
	int cnt=0,totalbill=0;
	Vector v1=(Vector)session.getAttribute("cart");
	if(v1==null)
		cnt=0;
	else
	{
		cnt=v1.size();
		for(int i=0;i<v1.size();i++)
		{
			String t[]=(String [])v1.get(i);
			totalbill+=Integer.parseInt(t[6]);
		}
	}
%>

<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">Shop India</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="viewcart.jsp?mode=display" class="cart-link">Your Shopping Cart</a>
      <div class="cl">&nbsp;</div>
      <span>Articles: <strong><%=cnt %></strong></span> &nbsp;&nbsp; <span>Cost: <strong>RS.<%=totalbill %></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="#" class="active">Home</a></li>
        <li><a href="#">Support</a></li>
        <li><a href="#">My Account</a></li>
        <li><a href="#">The Store</a></li>
        <li><a href="contact.jsp">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
   <div class="cl">&nbsp;</div>
    <!-- Sidebar -->
    <div id="sidebar">
      <!-- Search -->
      <div class="box search">
        <h2>Search by <span></span></h2>
        <div class="box-content">
          <form action="index.jsp" method="post">
            <label>Item name</label>
            <input type="text" class="field" name="item" />
            <h1><label>Category</label></h1>
<%
	try
	{
		rst=db.getdata("select * from category");
		while(rst.next())
		{
			boolean found=false;
			if(cat!=null)
			{
				for(int i=0;i<cat.length;i++)
				{
					if(rst.getInt(1)==Integer.parseInt(cat[i]))
					{
						found=true;
						break;
					}
				}
			}
			if(found==true)
			{
%>
			<h2><input type="checkbox" name="category" value="<%=rst.getInt(1)%>" checked="checked"/><%=rst.getString(2)%></h2><br />
<%
			}
			else
			{
%>
			<h2><input type="checkbox" name="category" value="<%=rst.getInt(1)%>" /><%=rst.getString(2)%></h2><br />

<%			
			}
		}
%>
<p>
<h1><label>Sub Category</label></h1>
<%
		rst=db.getdata("select * from subcategory");
		while(rst.next())
		{
			boolean found=false;
			if(subcat!=null)
			{
				for(int i=0;i<subcat.length;i++)
				{
					if(rst.getInt(1)==Integer.parseInt(subcat[i]))
					{
						found=true;
						break;
					}
				}
			}
			if(found==true)
			{
%>
			<h2><input type="checkbox" name="subcategory" value="<%=rst.getInt(1)%>" checked="checked" /><%=rst.getString(3)%></h2><br />
<%
			}
			else
			{
%>
			<h2><input type="checkbox" name="subcategory" value="<%=rst.getInt(1)%>" /><%=rst.getString(3)%></h2><br />
<%
			}	
		}		
	}
	catch(SQLException e)
	{
		out.print(e);
	}
	
%>


            <div class="inline-field">
              <label>Price</label>
              <select name="price" style="width:150px;" class="field small-field">

<%
	if(price.equals("All"))
	{
%>
		<option value="All" selected="selected">All</option>
<%
	}
	else
	{
%>
		<option value="All">All</option>		
<%
	}
	if(price.equals("Rs 1 to 1000"))
	{
%>
		<option value="Rs 1 to 1000" selected="selected">Rs 1 to 1000</option>
<%
	}
	else
	{
%>
		<option value="Rs 1 to 1000">Rs 1 to 1000</option>		
<%
	}
	if(price.equals("Rs 1001 to 2000"))
	{
%>
		<option value="Rs 1001 to 2000" selected="selected">Rs 1001 to 2000</option>
<%
	}
	else
	{
%>
		<option value="Rs 1001 to 2000">Rs 1001 to 2000</option>		
<%
	}
	if(price.equals("Rs 2001 to 5000"))
	{
%>
		<option value="Rs 2001 to 5000" selected="selected">Rs 2001 to 5000</option>
<%
	}
	else
	{
%>
		<option value="Rs 2001 to 5000">Rs 2001 to 5000</option>		
<%
	}
	if(price.equals("Rs 5001 & above"))
	{
%>
		<option value="Rs 5001 & above" selected="selected">Rs 5001 & above</option>
<%
	}
	else
	{
%>
		<option value="Rs 5001 & above">Rs 5001 & above</option>		
<%
	}
%>
              </select>
            </div>
            <input type="submit" class="search-submit" value="Filter" />
          </form>
        </div>
      </div>
      <!-- End Search -->
    </div>
    <!-- End Sidebar -->
    
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" width="720" height="250"/></a></li>
            <li><a href="#"><img src="css/images/slide2.jpg" alt="" width="720" height="250" /></a></li>
            <li><a href="#"><img src="css/images/slide3.jpg" alt="" width="720" height="250" /></a></li>
            <li><a href="#"><img src="css/images/slide4.jpg" alt="" width="720" height="250" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
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
			out.print("<td><form action='addcart.jsp?id="+rst.getInt(1)+"' method='post'>"+rst.getString(4)+"<br /><a href='details.jsp?id="+rst.getInt(1)+"'><img src='itemimages/"+rst.getString(6)+"' width='360' height='200' /></a><br />Rs."+rst.getInt(5)+"/-<br /><input type='submit' value='Add To Cart' /></form></td>");
			i++;
				if(i%2==0)
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
  <!-- Side Full -->
  <div class="side-full">
    <!-- More Products -->
    <div class="more-products">
      <div class="more-products-holder">
        <ul>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
          <li class="last"><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
        </ul>
      </div>
      <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
    </div>
    <!-- End More Products -->
  </div>
  <!-- End Side Full -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="#">Home</a> <span>|</span> <a href="#">Support</a> <span>|</span> <a href="#">My Account</a> <span>|</span> <a href="#">The Store</a> <span>|</span> <a href="contact.jsp">Contact</a> </p>
    <p class="right"> &copy; 2014 ShopIndia. Design by <a href="http://matrixcomputers.co.in">Matrix Computers</a> </p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
</body>
</html>
