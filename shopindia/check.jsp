<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
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
			out.print("password not match ");
		}
		//<jsp:include page="mail.jsp?mode=newaccount&email="+s4+"&pass="+s2></jsp:include>
%>
	
		<jsp:include page="login.jsp"></jsp:include>
	</body>
</html>