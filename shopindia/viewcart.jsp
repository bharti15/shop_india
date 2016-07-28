<%@ page import="java.sql.*,java.util.*" %>
<html>
	<head>
	

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	
<script type="text/javascript">
 
 		 function f1()
		{
				alert(" Sorry! this no. is out of stock. " );
		}
		$(function() 
		{
		
			/* For zebra striping */
        
			$("table tr:nth-child(odd)").addClass("odd-row");
		
			/* For cell text alignment */
		
			$("table td:first-child, table th:first-child").addClass("first");
		
			/* For removing the last border */
		
			$("table td:last-child, table th:last-child").addClass("last");

		});
	
</script>

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
	Vector<String[]> v2=(Vector<String []>)session.getAttribute("cart");
	if(v2==null)
	{
		out.print("Your cart is empty");
		out.print("<center><h1><a href='index.jsp'>Continue Shopping</a></h1></center>");
		return;
	}
	String mode=request.getParameter("mode");
	if(mode.equals("display") || mode.equals("edit"))
	{
%>
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
			<th>S.No</th>
			<th>Item Name</th>
			<th>Quantity</th>
			<th>price</th>
			<th>Amount</th>
			<th></th>
			<th></th>
		</tr>
<%	
		int sum=0;
		for(int i=0;i<v2.size();i++)
		{
			String t[]=(String [])v2.get(i);
			out.print("<tr><td>"+(i+1)+".</td><td>"+t[1]+"</td><td>");
			if(mode.equals("edit"))
			{
				int index=Integer.parseInt(request.getParameter("index"));
				if(index==i)
					/*if(t[6]< t[5])
					out.print("<input type='text' name='qty' value='"+t[5]+"' /><input type='button' onClick=" f1()" />save </button></form>");
					
					else */
						out.print("<form action='viewcart.jsp?mode=save&index="+i+"' method='post'><input type='text' name='qty' value='"+t[5]+"' /><input type='submit'   value='save' /></form>");
							
				else
					out.print(t[5]);
			}
			else
				out.print(t[5]);
			
			out.print("</td><td>"+t[2]+"</td><td>"+(Integer.parseInt(t[2])*Integer.parseInt(t[5]))+"</td><td><form action='viewcart.jsp?mode=edit&index="+i+"' method='post'><input type='submit' value='edit' /></form></td><td><form action='viewcart.jsp?mode=delete&index="+i+"' method='post'><input type='submit' value='delete' /></form></td></tr>");
			sum+=(Integer.parseInt(t[2])*Integer.parseInt(t[5]));
		}
%>
		<tr>
			<td colspan="4">Sum is </td>
			<td><%=sum%></td>
			<td></td>
			<td></td>
		</tr>

		</table>
		</center>
<%
		out.print("<center><h1><a href='index.jsp'>Continue Shopping</a></h1></center>");
		out.print("<center><h1><br /><a href='login.jsp'>Make Payment</a></h1></center>");
	}
	else if(mode.equals("delete"))
	{
		int index=Integer.parseInt(request.getParameter("index"));
		v2.remove(index);
		session.setAttribute("cart",v2);
%>
<jsp:forward page="viewcart.jsp?mode=display"></jsp:forward>
<%		
	}
	else if(mode.equals("save"))
	{
		int index=Integer.parseInt(request.getParameter("index"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		String t[]=(String [])v2.get(index);
		t[5]=qty+"";
		v2.set(index,t);
		session.setAttribute("cart",v2);
%>
<jsp:forward page="viewcart.jsp?mode=display"></jsp:forward>
<%		
	}

	
%>
</div>
	</body>
</html>