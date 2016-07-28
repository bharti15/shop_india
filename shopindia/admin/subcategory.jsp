<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
		function validation()
		{
			if(document.forms.addform1.subcatname.value.trim()=="")
			{
				alert("Type your subcategory name");
				return false;
			}
		}
		function validation1()
		{		
			if(document.forms.addform2.subcatname.value.trim()=="")
			{
				alert("Type your subcategory name");
				return false;
			}
		}
	</script>

	

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
<jsp:useBean class="shopindia.SubCategory" id="c1"></jsp:useBean>
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
					<td>Sub Category Id</td>
					<td>Sub Category Name</td>
					<td></td>
					<td></td>
				</tr>
<%
				int cnt=1,id=0;
				while(rst.next())
				{
					if(rst.getInt(2)!=id)
					{
						id=rst.getInt(2);
						cnt=1;
%>
					<tr>
						<%
						String s1=c1.getCatName(rst.getInt(2));
						%>
						<td>Category</td>
						<td><%=s1 %></td>
						<td></td>
						<td></td>
					</tr>
<%
					}
%>
					<tr>
						<td><%=cnt %></td>
						<td><%=rst.getString(3) %></td>
						<td><form action="subcategory.jsp?mode=change&id=<%=rst.getInt(1) %>&oldsubcatname=<%=rst.getString(3) %>&oldcatid=<%=rst.getInt(2) %>" method="post"><input type="submit" value="change" /></form></td>
						<td><form action="subcategory.jsp?mode=delete&id=<%=rst.getInt(1) %>" method="post"><input type="submit" value="delete" /></form></td>
					</tr>
<%
					cnt++;
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
		<jsp:forward page="subcategory.jsp?mode=display"></jsp:forward>
<%			
	}
	else if(mode.equals("add"))
	{
%>		
		<form action="subcategory.jsp?mode=addsave" method="post" name="addform1">
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
		<td>Enter Sub Category name to add</td>
		<td><input type="text" name="subcatname"></td>
		</tr>
		<tr><td>Select Category</td><td><select name="category">
				<%
					ResultSet rst=c1.getAllCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(2) %></option>
				<%
					}
				%>
			</select></td></tr>
			<tr>
			<td><input type="submit" value="save" onclick="return validation()"></td>
			<td><input type="Reset" value="reset" onclick="return validation()"></td>
			</tr>
		</table>
		</center>
		</form>
		
<% 		
		return;
	}
	else if(mode.equals("change"))
	{
		String oldsubcatname=request.getParameter("oldsubcatname");
		String id=request.getParameter("id");
		int oldcatid=Integer.parseInt(request.getParameter("oldcatid"));
		String oldcatname=c1.getCatName(oldcatid);
		
%>		
		<form action="subcategory.jsp?mode=editsave&id=<%=id %>" method="post" name="addform2">
			<br>
			<h1><center>Old Sub Category name is <%=oldsubcatname %></h1></center>
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
			<td>Enter new Sub Category name</td>
			<td><input type="text" name="subcatname"></td>
			</tr>
			<tr>
			<td>Select Category</td><td><select name="category">
				<%
					ResultSet rst=c1.getAllCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(2) %></option>
				<%
					}
				%>
			</select>
			</td></tr>
			<tr><td><input type="submit" value="save" onclick="return validation1()"/></td>
			<td><input type="reset" value="reset" onclick="return validation1()"/></td></tr>
			</table>
			</center>
		</form>
<% 		
		return;
	}
	else if(mode.equals("editsave"))
	{
		int id=Integer.parseInt(request.getParameter("id"));
		String newCatName=request.getParameter("subcatname");
		int newCatId=Integer.parseInt(request.getParameter("category"));
		c1.update(id,newCatName,newCatId);
%>
		<jsp:forward page="subcategory.jsp?mode=display"></jsp:forward>
<%			
	}
	else if(mode.equals("addsave"))
	{
		String subcatname=request.getParameter("subcatname");
		int category=Integer.parseInt(request.getParameter("category"));
		c1.add(category,subcatname);
		response.sendRedirect("subcategory.jsp?mode=display");

%>
<%		
	}
%>
<center>
<h2><a href="subcategory.jsp?mode=add">Add New Sub Category</a><br />
<br/>

<a href="adminhome.jsp">Admin Home</a></h2>
</center>	
</body>
</html>