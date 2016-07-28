<%@ page import="java.sql.*,java.util.*" %>
<html>
	<head>
	</head>
	<body>
<%
	shopindia.DConnection db=new shopindia.DConnection();
	ResultSet rst=null;
	int id=Integer.parseInt(request.getParameter("id"));
	rst=db.getdata("select * from items where item_id="+id);
	rst.next();
	String record[]=new String[7];
	record[0]=rst.getString(1);
	for(int i=1;i<=4;i++)
		record[i]=rst.getString(i+3);
	record[5]="1";
	record[6]=rst.getString(5);
	Vector<String[]> v1=(Vector)session.getAttribute("cart");
	if(v1==null)
		v1=new Vector<String[]>();
	boolean flag=false;
	for(int i=0;i<v1.size();i++)
	{
		String t[]=(String [])v1.get(i);
		if(t[0].equals(record[0]))
		{
			t[5]=Integer.parseInt(t[5])+1+"";
			t[6]=Integer.parseInt(t[5])*Integer.parseInt(t[2])+"";
			v1.set(i,t);
			flag=true;
			break;
		}
	}
	if(flag==false)
		v1.addElement(record);
	session.setAttribute("cart",v1);
%>
<jsp:include page="index.jsp"></jsp:include>
	</body>
</html>