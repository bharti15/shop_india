<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>

<title>Shop India</title>
<script>
	function validation()
		{
			if(document.forms.form1.user.value.trim()=="")
			{
				alert("Type user name");
				return false;
			}
			if(document.forms.form1.pass.value.trim()=="")
			{
				alert("Type pass name");
				return false;
			}
		}
	</script>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>

<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<%
		int menu=3;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
 

 <div id="main">
<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

	<form action="myaccountopen.jsp?mode=check" method="post" name="form1">

	   <tr>
	    <td>User name</td>
	    <td><input type="text" name="user" /></td>
	   </tr>
	   <tr>
	    <td>Password</td>
	    <td><input type="password" name="pass" /></td>
	   </tr>
	   <tr>
	    <td><input type="submit" value="login" onclick="return validation()"  /></td>
		<td><input type="Reset" value="Reset" onclick="return validation()"  /></td>
	</form>
</table>
</center>
<center>
	<form action="myaccountopen.jsp?mode=signup" method="post">
	    <td><input type="submit" value="register" rows=30 /></td>
	   </tr>
	</form> 
	<div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <%@ include file="footer.jsp" %>
</div>
<!-- End Shell -->
</body>
</html>
