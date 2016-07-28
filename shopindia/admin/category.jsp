<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		function validation()
		{
			if(document.forms.addform.catname.value.trim()=="")
			{
				alert("Type your category name");
				return false;
			}
		}
		function validation1()
		{
			if(document.forms.changeform.catname.value.trim()=="")
			{
				alert("Type your category name");
				return false;
			}
		}
	</script>
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
<jsp:useBean class="shopindia.Category" id="c1"></jsp:useBean>
<%
	String mode=request.getParameter("mode");
	if(mode.equals("display"))
	{
		try
		{
			ResultSet rst=c1.display();
%>
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
				<tr>
					<td>Category Id</td>
					<td>Category Name</td>
					<td></td>
					<td></td>
				</tr>
<%
				while(rst.next())
				{
%>
					<tr>
						<td><%=rst.getInt(1) %></td>
						<td><%=rst.getString(2) %></td>
						<td><form action="category.jsp?mode=change&id=<%=rst.getInt(1) %>&oldname=<%=rst.getString(2) %>" method="post"><input type="submit" value="change" /></form></td>
						<td><form action="category.jsp?mode=delete&id=<%=rst.getInt(1) %>" method="post"><input type="submit" value="delete" /></form></td>
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
	}
	else if(mode.equals("delete"))
	{
		c1.delete(Integer.parseInt(request.getParameter("id")));
%>
		<jsp:forward page="category.jsp?mode=display"></jsp:forward>
<%			
	}
	else if(mode.equals("add"))
	{
%>		
		<form action="category.jsp?mode=addsave" method="post" name="addform">
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr><td>Enter Category name to add</td>
				<td><input type="text" name="catname"></td></tr>
			<tr>
			<td><input type="submit" value="save" onclick="return validation()"></td>
			<td><input type="Reset" value="reset" onclick="return validation()"></td>
			</tr>
			</table>
			</center>
		</form>
<% 		
		
	}
	else if(mode.equals("change"))
	{
		String oldname=request.getParameter("oldname");
		String id=request.getParameter("id");
%>		
		<form action="category.jsp?mode=editsave&id=<%=id %>" method="post" name="changeform">
			<br>
			<center><h1>Old Category name is <%=oldname %></h1></center>
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
			<td>Enter new Category name</td>
			<td><input type="text" name="catname"></td>
			</tr>
			<tr>
			<td>
			<input type="submit" value="save" onclick="return validation1()"></td>
			<td><input type="Reset" value="reset" onclick="return validation1()">
			</td>		
			
			</tr>
			</table>
			</center>
		
		</form>
<% 		
	}
	else if(mode.equals("editsave"))
	{
		int id=Integer.parseInt(request.getParameter("id"));
		String newName=request.getParameter("catname"); 
		c1.update(id,newName);
%>
		<jsp:forward page="category.jsp?mode=display"></jsp:forward>
<%			
	}
	else if(mode.equals("addsave"))
	{
		String name=request.getParameter("catname"); 
		if(name!=null && ! name.equals(""))
			c1.add(name);
		response.sendRedirect("category.jsp?mode=display");
%>

<%		
	}
%>
<center>
<h1><a href="category.jsp?mode=add">Add New Category</a></h1>
<br>
<br>
<h1><a href="adminhome.jsp">Admin Home</a></h1>
</center>
</div>
</body>
</html>