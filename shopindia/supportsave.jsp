<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
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
	<%
	String s1= request.getParameter("mail");
	String s2= request.getParameter("query");
	shopindia.DConnection db=new shopindia.DConnection();
	ResultSet rst1;
	rst1=db.getdata("select max(id) from inbox");
	rst1.next();
	int id=rst1.getInt(1);
	id++;
	db.setdata("insert into inbox(mail_id,query,id) values('"+s1+"','"+s2+"',"+id+")");
	db.close();
%>
<%--<jsp:include page="mail.jsp?mode=query&email="+s1+"&query="+s2></jsp:include>--%>
	<br>
	<br>
	<center><h1>Your query/complaint has been sent to ShopIndia<br /><br/>
	Your query/complaint number is <%=id%>.
	</br></br>
	<a href="index.jsp">Home Page</a></h1></center>
	</body>
</html>