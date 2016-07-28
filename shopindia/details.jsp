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
	<%
		int menu=1;
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
<h1>Product Details</h1>


<%
	int id=Integer.parseInt(request.getParameter("id"));
	
	rst=db.getdata("select * from items where item_id="+id);
	rst.next();
%>
	<table border="1">
		<tr>
			<td>Item Name</td>
			<td><%=rst.getString(4)%></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><%=rst.getInt(5)%></td>
		</tr>
		<tr>
			<td>Details</td>
			<td><%=rst.getString(8)%></td>
		</tr>
		<tr>
			<td>Stock Available</td>
			<td><%=rst.getInt(7)%></td>
		</tr>
		<tr rowspan="10">
			<td>Image</td>
			<td><img src="<%="/ShopIndia/itemimages/"+rst.getString(6)%>" /></td>
		</tr>
	</table>
	<a href="index.jsp">Go Back</a>
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
