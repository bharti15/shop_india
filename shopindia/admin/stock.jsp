<%@page import="shopindia.DConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
</head>
<body bgcolor="cyan">
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

<jsp:useBean class="shopindia.Stock" id="stock"></jsp:useBean>
<%
       String mode=request.getParameter("mode");
       if("display".equals(mode) || "edit".equals(mode))
       {
    	   ResultSet rst=stock.display();
    	   try
    	   {
%>				<center>
				<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
  
   		    	<tr>
			    	<td>S.No.</td>
		    		<td>Item Name</td>
		    		<td>Stock</td>
		    		<td></td>
	    		</tr>
<%
			    int cnt=1,catid=0,subcatid=0;
		    	while(rst.next())
	     		{
			    	if(rst.getInt(2)!=catid)
    				{
    					catid=rst.getInt(2);
%>
				<tr>
				<%
					String catname=stock.getCatName(rst.getInt(2));
				%>
					<td>Category</td>
					<td><%=catname %></td>
					<td></td>
					<td></td>
				</tr>
<%
		        	}
		
			    	if(rst.getInt(3)!=subcatid)
	    			{
		    			subcatid=rst.getInt(3);
		     			cnt=1;
%>
			    	<tr>
				    <%
			    		String subcatname=stock.getSubCatName(rst.getInt(3));
					%>
			    		<td>Sub Category</td>
			    		<td><%=subcatname %></td>
			    		<td></td>
					<td></td>
		    		</tr>
<%
			    	}
%>
		    		<tr>
		    			<td><%=cnt %></td>
		    			<td><%=rst.getString(4) %></td>
<%
                    if("edit".equals(mode))
                    {
                    	if(rst.getString(4).equals(request.getParameter("itemname")))
                    		out.print("<td><form action='stock.jsp?mode=save&id="+rst.getInt(1)+"' method='post'><input type='text' name='stock' value='"+rst.getInt(7)+"' /><input type='submit' value='save' /></form></td>");
                    	else
                    		out.print("<td>"+rst.getInt(7)+"</td>");
                    }
                    else
                    	out.print("<td>"+rst.getInt(7)+"</td>");
%>
		    			<td><form action="stock.jsp?mode=edit&itemname=<%=rst.getString(4) %>" method="post"><input type="submit" value="edit" /></form></td>					
				</tr>
<%
		    		cnt++;
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
       else if("save".equals(mode))
       {
    	   int id=Integer.parseInt(request.getParameter("id"));
    	   int Stock=Integer.parseInt(request.getParameter("stock"));
    	   stock.update(id,Stock);
%>
        <jsp:forward page="stock.jsp?mode=display"></jsp:forward>
<%
       }
%>

<center><h1><a href="adminhome.jsp">Admin Home</a></h1></center>
</body>
</html>