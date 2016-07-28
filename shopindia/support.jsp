<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>

<title>Shop India</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>

<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<%
		int menu=2;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">

<form action="supportsave.jsp" method="post">
<center><table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
<tr>
 <td>Enter your query/complaint</td>
 <td><input type="text" name="query" /></td>
</tr>
<tr>
 <td>Enter your mailid</td>
 <td><input type="text" name="mail" /></td>
</tr>
<tr>
 <td colspan="2"><input type="submit" value="send" /></td>
</tr>
</table></center>
</form>	
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <%@ include file="footer.jsp" %>
</div>
<!-- End Shell -->
</body>
</html>
