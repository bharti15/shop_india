<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all" />
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
			}
</script>

</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
    <h1 id="logo"><a href="#">Shop India </a></h1>
  </div>
  <!-- End Header -->
  <!-- Main -->
	<br>
    <br />
	<center><h1>Welcome admin</h1></center>
    <br />
	<form action="login.jsp" method="post" name="form1">
    <center><table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
	<tr><td>Username</td><td><input type="text" name="user" /><br /></td></tr>
	<tr><td>Password</td><td><input type="password" name="pass" /><br /></td></tr>
		<tr><td><input type="submit" value="login" onclick="return validation()" /></td>
        <td><input type="Reset" value="Reset" onclick="return validation()" /></td>
        </tr>
        </table>
    </center>
	</form> 
</body>
</html>