<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		
		<script type="text/javascript">
		function validation()
		{
			if(document.forms.form1.user.value.trim()=="")
			{
				alert("Type user name");
				return false;
			}
			if(document.forms.form1.pass.value.trim()=="")
			{
				alert("Type pass ");
				return false;
			}
		}
		</script>
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		</head>
	<body>
		<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
</div>
<form action="logincheck.jsp" method="post" name="form1">
<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
		<td>Enter User Name</td>
		<td><Input type="text"  name="user"></td>
		</tr>
		<tr>
		<td>Enter User Password</td>
		<td><Input type="password"  name="pass"></td>
		</tr>	
		<tr>
		<td><input type="submit" value="Login" onclick="return validation()"></td>
		<br >
		<td><a href="sign_up.jsp">NewUserSignup</a></td>
		</tr>
		</table>
		</center>
		</form>
	</body>
</html>