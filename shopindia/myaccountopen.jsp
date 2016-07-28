<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>

<title>Shop India</title>

	
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
</div>  
  <!-- End Header -->
  <!-- Main -->
<div id="main">
<%
	String mode=request.getParameter("mode");
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	shopindia.DConnection db=new  shopindia.DConnection();
	if("check".equals(mode))
	{
		try
		{
			ResultSet rst1=db.getdata("select * from users where userid='"+user+"' and password='"+pass+"' ");
			if(rst1.next()) // if authorized
			{
%>
				<a href="myaccountopen.jsp?mode=pending&user=<%=user%>&pass=<%=pass%>"><center>track pending request</center></a><br/>
				<a href="myaccountopen.jsp?mode=deliver&user=<%=user%>&pass=<%=pass%>"><center>track delivered request</center></a><br/>
<%
			}
			else //if unauthorized
			{
				out.print("<h1><center>Invalid user or password if you login first time than first register.click register button</h1></center>");
				
			}
		}
		catch(SQLException e)
		{
			out.print(e.getMessage());
		}
	}
	else if("pending".equals(mode))
	{
		ResultSet rst1=	db.getdata("select * from porders where user='"+user+"'");
			
%>
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
		  <th>order no.</th>
		  <th>amount</th>
		</tr>
<%
		boolean flag=false;
		while(rst1.next())
		{
			flag=true;		
%>
				
			<tr><td><%=rst1.getInt(1)%></td><td><%=rst1.getInt(3)%></td></tr>
<%	
		}
%>
		</table>
		</center>
<%
		if(flag==false)
	    		out.print("<h1><center>you have no pending orders</h1></center>");
%>
		<br /><a href="myaccountopen.jsp?mode=check&user=<%=user%>&pass=<%=pass%>"><h1><center>Back</center></h1></a>
<%
	}
	else if("deliver".equals(mode))
	{
		
		ResultSet rst1=	db.getdata("select * from dorders where user='"+user+"'");
%>
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
			<th>order no.</th>
			<th>amount</th>
			</tr>
<%
			boolean flag=false;
			while(rst1.next())
			{
				flag=true;
%>
				<tr><td><%=rst1.getInt(1)%></td><td><%=rst1.getInt(3)%></td></tr>
<%	
			}
			if(flag==false)
				out.print("<h1><center>you have no deliver orders</h1></center>");
%>
		</table>
		<br /><a href="myaccountopen.jsp?mode=check&user=<%=user%>&pass=<%=pass%>"><center><h1>Back</h1></center></a>

<%
	
	}
	else if("signup".equals(mode))
	{
%>
		
		<form action="myaccountopen.jsp?mode=registr" method="post" name="form1">
			<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<fieldset>
			<legend>Enter Your details</legend>
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
			<tr><td><input type="submit" value="Submit" onclick="return validation()"/></td>
			<td><input type="reset" value="Reset" /></td></tr>
		</fieldset>
		</table>
		</center>
		</form>
<%
		}
		else if("registr".equals(mode))
		{
%>
		<jsp:useBean class="shopindia.Check" id="c1"></jsp:useBean>
<%
		String s1= request.getParameter("user");
		String s2= request.getParameter("pass");
		String s3= request.getParameter("repass");
		String s4= request.getParameter("email");
		String s5= request.getParameter("contact");
		String s6= request.getParameter("address");
		if(s2.equals(s3))
		{
			c1.add(s1,s2,s4,s5,s6);
		}
		else
		{
			out.print("<center><h1>password not match</h1></center>");
		}
		//<jsp:include page="mail.jsp?mode=newaccount&email="+s4+"&pass="+s2></jsp:include>
%>
	
<%
	}
	
	else
	{
	}
	
%>
	<center>
	<h1><br>
	<br>
	<a href="index.jsp">home</a></h1></center>
	
<div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <br>
  <br>
  <%@ include file="footer.jsp" %>
  </div>
<!-- End Shell -->
</body>
</html>
