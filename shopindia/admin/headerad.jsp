<%@ page import="java.util.*"%>
<h1 id="logo"><a href="#">Shop India</a></h1>   
   <!-- Navigation -->
    <div id="navigation">
<ul>
<%
	if(menu==1)
	{
%>
        <li><a href="category.jsp?mode=display">categories</a></li>
<%
	}
	else
	{
%>
        <li><a href="category.jsp?mode=display">categories</a></li>
<%
	}
%>
<%
	if(menu==2)
	{
%>
	<li><a href="subcategory.jsp?mode=display">SubCategories</a></li>
<%
	}
	else
	{
%>
	<li><a href="subcategory.jsp?mode=display">SubCategories</a></li>
<%
	}
%>

<%
	if(menu==3)
	{
%>
        <li><a href="item.jsp?mode=display">Items</a></li>
<%
	}
	else
	{
%>
        <li><a href="item.jsp?mode=display">Items</a></li>
<%
	}
%>

<%
	if(menu==4)
	{
%>
        <li><a href="stock.jsp?mode=display">Stock</a></li>
<%
	}
	else
	{
%>
        <li><a href="stock.jsp?mode=display">Stock</a></li>
<%
	}
%>
<%
	if(menu==5)
	{
%>
        <li><a href="porder.jsp?mode=display">PendingOrders</a></li>
<%
	}
	else
	{
%>
        <li><a href="porder.jsp?mode=display">PendingOrders</a></li>
<%
	}
%>
<%
	if(menu==6)
	{
%>
	<li><a href="dorder.jsp">DeliveredOrders</a></li>
<%
	}
	else
	{
%>
	<li><a href="dorder.jsp">DeliveredOrders</a></li>
<%
	}
%>

<%
	if(menu==7)
	{
%>
        <li><a href="users.jsp?mode=display">Users</a></li>
<%
	}
	else
	{
%>
        <li><a href="users.jsp?mode=display">Users</a></li>
<%
	}
%>

<%
	if(menu==8)
	{
%>
        <li><a href="query.jsp?mode=display">Queries</a></li>
<%
	}
	else
	{
%>
        <li><a href="query.jsp?mode=display">Queries</a></li>
<%
	}
%>

<%
	if(menu==9)
	{
%>
        <li><a href="logout.jsp">Logout</a></li>
<%
	}
	else
	{
%>
        <li><a href="logout.jsp">LogOut</a></li>
<%
	}
%>
</ul>

    </div>
    <!-- End Navigation -->
