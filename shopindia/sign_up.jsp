<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			function validation()
			{
			
				if(document.forms.form1.user.value.trim()=="")
				{
					alert("Type your name");
					return false;
				}
				else if(document.forms.form1.pass.value=="")
				{
					alert("Type your password");
					return false;
				}
				else if(document.forms.form1.repass.value=="")
				{
					alert("ReType your password");
					return false;
				}
				else if(document.forms.form1.pass.value != document.forms.form1.repass.value)
				{
					alert("password & retype password mismatch");
					return false;
				}
				else if(document.forms.form1.email.value=="")
				{
					alert("Enter email ");
					return false;
				}
				if(isNaN(document.forms.form1.contact.value) || document.forms.form1.contact.value.trim()=="")
				{
					alert("Invalid contact");
					return false;
				}
				
				else if(document.forms.form1.address.value=="")
				{
					alert("Type address");
					return false;
				}
			}
		</script>
				

		<link rel="stylesheet" href="css/style.css" type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
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
	
		<form action="check.jsp" method="post" name="form1">
			<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			<fieldset>
			<tr><legend>Enter Your details</legend></tr>
			<tr><td><Label for="name">Name</Label></td>
			<td><Input type="text" name="user"  /><br></td></tr>
			
			<tr><td><Label for="password">Password</Label></td>
			<td><Input type="password" name="pass"  /><br></td></tr>

			<tr><td><Label for="Re password">Re Type Password</Label></td>
			<td><Input type="password" name="repass"  /><br></td></tr>
			
			<tr><td><Label for="email">Email</Label></td>
			<td><input type="email" name="email"  /><br></td></tr>
			
			<tr><td><Label for="contact_no">Contact_no.</Label></td>
			<td><input type="text" name="contact"  /><br></td></tr>
			
			<tr><td><Label for="address">Address</Label></td>
			<td><textarea rows="2" cols="20" name="address"></textarea><br></td></tr>
			<tr><td><input type="submit" value="Submit" onclick="return validation()" /></td>
			<td><input type="reset" value="Reset" /></td></tr>
			</fieldset>
		</form>
	</body>
</html>