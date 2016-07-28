<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<script type="text/javascript">
		function validation()
		{
			if(document.forms.changeform.pswd.value.trim()=="")
			{
				alert("Type new password.");
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

<jsp:useBean class="shopindia.Users" id="c1"></jsp:useBean>
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
					<td> User Name</td>
					<td>Password</td>
					<td>Email</td>
					<td>Contact No.</td>
					<td>Address</td>		
					<td></td>
					<td></td>
				</tr>
<%
				while(rst.next())
				{
%>
					<tr>
						<td><%=rst.getString(1) %></td>
						<td><%=rst.getString(2) %></td>
						<td><%=rst.getString(4) %></td>
						<td><%=rst.getString(5) %></td>
						<td><%=rst.getString(6) %></td>
						
						<td><form action="users.jsp?mode=change&id=<%=rst.getString(1) %>&password=<%=rst.getString(2) %>&email=<%=rst.getString(4) %>&contact No.=<%=rst.getString(5) %>" method="post"><input type="submit" value="change" /></form></td>
					    <td><form action="users.jsp?mode=delete&id=<%=rst.getString(1) %>" method="post"><input type="submit" value="delete" /></form></td>
					</tr>
<%					
				}
%>			
			</table>
			</center>
			</form>
<%
		}
		catch(SQLException e)
		{
			
		}
	}
	else if(mode.equals("delete"))
	{
		c1.delete(request.getParameter("id"));
%>
		<jsp:forward page="users.jsp?mode=display"></jsp:forward>
<%			
	}

	
		
	else if(mode.equals("change"))
	{
		String password=request.getParameter("password");
		String id=request.getParameter("id");
%>		
		<form action="users.jsp?mode=editsave&id=<%=id %>" method="post" name="changeform">
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
			<td>Old password is</td><td><%= password %><br /></td></tr>
			<tr><td>Enter new password</td><td> <input type="text" name="pswd"></td></tr>
			<tr><td><input type="submit" value="save" onclick="return validation()"></td>
			<td><input type="reset" value="reset" onclick="return validation()"></td></tr>
			</table>
			</center>
		</form>                 
<% 		
	}
	else if(mode.equals("editsave"))
	{
		String userid=request.getParameter("id");
		String password=request.getParameter("pswd"); 
		out.print(password);
		
		c1.update(userid,password);
%>
		<jsp:forward page="users.jsp?mode=display"></jsp:forward>
<%			
	}
	
%>
<center><h1><a href="adminhome.jsp">Admin Home</a></h1></center>
</body>
</html>