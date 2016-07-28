<%@ page import="java.sql.*,java.util.*" %>
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
	ResultSet rst=null;
	shopindia.DConnection db=new shopindia.DConnection();
	int order_id;
	String user=request.getParameter("user");
	    out.print("<br><br><center><h1>"+user+"</h1></center>");
        String value=request.getParameter("payment");
        if(value==null || "".equals(value))
        {
                out.print("Select any Option");
                return;
        }
        else if("credit".equals(value))
        {
            response.sendRedirect("credit.jsp?mode=details&user="+user);   
            return;       
        }
        else if("netbanking".equals(value))
        {
%>

             <form action="netbanking.jsp" method="post">
             <center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			 <tr><td>Select bank</td></tr>
             <tr><td><select name="bank">
                 <option value="icici">ICICI Bank</option>
                 <option value="sbi">State Bank Of India</option>
                 <option value="pnb">Punjab National Bank</option>
                 <option value="hdfc">HDFC Bank</option>
             </select><br></td></tr>
             <tr><td><input type="submit" value="Submit"></td></tr>
			 </table>
			 </center>
             </form>
<%
             return;
        }
	rst=db.getdata("select max(order_id) from porders");
	rst.next();
	order_id=rst.getInt(1)+1;
	db.close();

	Vector<String []> v2=(Vector<String []>)session.getAttribute("cart");
	int sum=0;
	for(int i=0;i<v2.size();i++)
	{
		String t[]=v2.get(i);
		db.setdata("insert into porders_det values("+order_id+","+t[0]+","+t[5]+","+t[2]+","+t[6]+")");
                rst=db.getdata("select stock from items where item_id="+t[0]);
                rst.next();
                int stock=rst.getInt(1);
                stock=stock-Integer.parseInt(t[5]);
                db.setdata("update items set stock="+stock+" where item_id="+t[0]);
                db.close();
		sum+=Integer.parseInt(t[6]);
	}
	db.setdata("insert into porders values("+order_id+",'"+user+"',"+sum+")");
	rst=db.getdata("select email from users where userid='"+user+"'");
	rst.next();
	String email=rst.getString(1);	
	db.close();
	session.invalidate();
	
%>
<%--<jsp:forward page="mail.jsp?mode=bill&email=<%=email%>&amt=<%=sum%>"></jsp:forward>--%>
<jsp:forward page="success.jsp"></jsp:forward>
</body>
</html>