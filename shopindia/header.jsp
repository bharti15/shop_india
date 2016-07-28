<%@ page import="java.util.*"%>
<%
	int cnt=0,totalbill=0;
	Vector v1=(Vector)session.getAttribute("cart");
	if(v1==null)
		cnt=0;
	else
	{
		cnt=v1.size();
		for(int i=0;i<v1.size();i++)
		{
			String t[]=(String [])v1.get(i);
			totalbill+=Integer.parseInt(t[6]);
		}
	}
%>
    <h1 id="logo"><a href="#">Shop India</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="viewcart.jsp?mode=display" class="cart-link">Your Shopping Cart</a>
      <div class="cl">&nbsp;</div>
      <span>Articles: <strong><%=cnt %></strong></span> &nbsp;&nbsp; <span>Cost: <strong>RS.<%=totalbill %></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
<%
	if(menu==1)
	{
%>
        <li><a href="index.jsp" class="active">Home</a></li>
<%
	}
	else
	{
%>
        <li><a href="index.jsp">Home</a></li>
<%
	}
%>
<%
	if(menu==2)
	{
%>
	<li><a href="support.jsp" class="active">Support</a></li>
<%
	}
	else
	{
%>
	<li><a href="support.jsp">Support</a></li>
<%
	}
%>

<%
	if(menu==3)
	{
%>
        <li><a href="myaccount.jsp" class="active">My Account</a></li>
<%
	}
	else
	{
%>
        <li><a href="myaccount.jsp">My Account</a></li>
<%
	}
%>

<%
	if(menu==4)
	{
%>
        <li><a href="contact.jsp" class="active">Contact</a></li>
<%
	}
	else
	{
%>
        <li><a href="contact.jsp">Contact</a></li>
<%
	}
%>
       </ul>
    </div>
    <!-- End Navigation -->
