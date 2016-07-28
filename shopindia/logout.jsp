<%@ page import="" %>
<html>
	<head>
	</head>
	<body>
<%
	session.invalidate();
%>	
	<jsp:forward page="index.jsp"></jsp:forward>
	</body>
</html>