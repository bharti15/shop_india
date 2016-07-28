
<html>
	<head>
<link rel="stylesheet" href="css/style.css" type="text/css" />
	</head>
	<body>
<%
String user=request.getParameter("user");
%>
<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
</div>

<form action="payment.jsp?user=<%=user%>" method="post">
	<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

<tr><td>Select Payment Mode<br/></td></tr>
<tr><td><input type="radio" name="payment" value="cash">Cash On Delivery<br></td></tr>
<tr><td><input type="radio" name="payment" value="credit">Debit/Credit Card<br></td></tr>
<tr><td><input type="radio" name="payment" value="netbanking">Net Banking<br></td></tr>
	<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
		</center>
	</form>

	</body>
</html>