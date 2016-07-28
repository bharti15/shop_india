<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
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
</div>

<%
      if("details".equals(request.getParameter("mode")))
      {
%>

          <form action="credit.jsp?mode=pin&user=<%=request.getParameter("user")%>" method="post">
             <br>
			 <br>
			 <center><h1>Submit Your Card Details</h1></center>
            <center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

             <tr><td><label for="cardno">Card Number</label></td><td><input type="text" name="cardno" id="cardno" placeholder="Enter Card Number"></td></tr>
             <tr><td><label for="exp">Expiary Date</label></td><td><input type="text" name="exp" id="exp" placeholder="MM/YY"></td></tr>
             <tr><td><label for="cvv">CVV</label></td><td><input type="password" name="cvv" id="cvv" placeholder="Enter 3 digits CVV"></td></tr>
             <tr><td><label for="name">Name</label></td><td><input type="text" name="name" id="name" placeholder="Name On Card"></td></tr>
             <tr><td colspan="2"><input type="submit" value="Pay"></td></tr>
            </table>
		</center>
          </from>
<%
      } 
      else if("pin".equals(request.getParameter("mode")))
      {
%>       
         <form action="payment.jsp?payment=1&user=<%=request.getParameter("user")%>" method="post">
         <center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			 <tr><td><label for="atmpin">Enter ATM Pin</label></td><td><input type="password" name="atmpin" id="atmpin" placeholder="Enter Your ATM Pin"></td></tr>
             <tr><td colspan="2"><input type="submit" value="Pay"></td></tr>
          </table>
		  </center>
		  </from>
          </table>
<%
      }          
%>
</body>
</html>