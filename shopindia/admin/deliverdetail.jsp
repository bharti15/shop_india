<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	
<script type="text/javascript">
 
		$(function() 
		{
		
			/* For zebra striping */
        
			$("table tr:nth-child(odd)").addClass("odd-row");
		
			/* For cell text alignment */
		
			$("table td:first-child, table th:first-child").addClass("first");
		
			/* For removing the last border */
		
			$("table td:last-child, table th:last-child").addClass("last");

		});
	
</script>


	<link rel="stylesheet" href="../css/style.css" type="text/css" />
</head>
<body>
<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1); 
String auth=(String)session.getAttribute("user");
if(!"auth".equals(auth))
{
	response.sendRedirect("index.jsp");
	return;
}
%> 

<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
	<%@ include file="headerad.jsp" %>
  </div>
  <!-- End Header -->
 </div> 
<jsp:useBean class="shopindia.DeliverDetail" id="c1"></jsp:useBean>

<%
	
		try
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ResultSet rst=c1.display(id);
%>
					
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
  			<tr>
					<td>Order ID</td>
					<td>Item ID</td>
					<td>Quantity</td>
					<td>Price</td>
					<td>Amount</td>
					
			</tr>
<%
				while(rst.next())
				{
%>
					<tr>
						<td><%=rst.getInt(1) %></td>
						<td><%=rst.getInt(2) %></td>
						<td><%=rst.getInt(3) %></td>
						<td><%=rst.getInt(4) %></td>
						<td><%=rst.getInt(5) %></td>
					
						</tr>
<%					
				}
%>			
			</table>
			</center>
<%
		}
		catch(SQLException e)
		{
			
		}

	%>

<center><h1>	
<a href="adminhome.jsp">Admin Home</a></h1></center>
</div>
</body>
</html>