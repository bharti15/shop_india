<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<title>Insert title here</title>
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

<%
	shopindia.DConnection db=new shopindia.DConnection();
	int item_id=Integer.parseInt(request.getParameter("item"));
	int stock=Integer.parseInt(request.getParameter("stock"));
	db.setdata("update items set stock=stock+"+stock+" where item_id="+item_id);
	db.close();
%>	
Stock Added<br />
<jsp:include page="addstock.jsp"></jsp:include>
</body>
</html>