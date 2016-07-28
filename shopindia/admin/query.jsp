<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

		<script type="text/javascript">
		function validation()
		{
			if(document.forms.form1.resp.value.trim()=="")
			{
				alert("Type response");
				return false;
			}
			
		}
		</script>
</head>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
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


<%
	shopindia.DConnection db=new shopindia.DConnection() ;
	String mode=request.getParameter("mode");
	if("display".equals(mode))
      {
	try{
		ResultSet rst=db.getdata("select * from inbox where response is null") ;
%>
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;text-align:center;margin:50px;">
		<tr><th>ID</th><th>Mail-ID</th><th>Query</th><th>Response</th><th></th></tr>
<%
		while(rst.next())
		{
%>
			<tr>
			<form action="query.jsp?mode=update" method="post" name="form1">
			<td><input type="text" value="<%=rst.getInt(3)%>" name="id" /></td>
			<td><input type="text" value="<%=rst.getString(1)%>" name="eid" /></td>
			<td><input type="text" value="<%=rst.getString(2)%>" name="query" /></td>
			<td><textarea rows="5" cols="20" name="resp" ></textarea></td>
			<td><input type="submit" name="b1" value="SEND" onclick="return validation()" /></td>
			</form>
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
		e.printStackTrace();
	}
      }
	else if("update".equals(mode))
	{
		int id=Integer.parseInt(request.getParameter("id")) ;
		String resp=request.getParameter("resp");
		String eid=request.getParameter("eid");
		String query=request.getParameter("query");
		db.setdata("update inbox set response='"+resp+"' where id="+id) ;
		//response.sendRedirect("mail.jsp?resp="+resp+"&query="+query+"&mode=queryresp");

%>

<%
	}
%>
	<center><h1><a href="adminhome.jsp">Back to admin panel</a></h1></center>
</body>
</html>