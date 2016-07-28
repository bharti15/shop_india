<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.DeferredFileOutputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script type="text/javascript">
		function validation()
		{
			if(document.forms.changeform.itemname.value.trim()=="")
			{
				alert("Type your new  item name");
				return false;
			}
			
			if(isNaN(document.forms.changeform.price.value) || document.forms.changeform.price.value.trim()=="")
				{
					alert("Invalid price");
					return false;
				}
		}
		function validation1()
		{		
			if(document.forms.addform.itemname.value.trim()=="")
			{
				alert("Type new item name");
				return false;
			}
			
			if(isNaN(document.forms.addform.price.value) || document.forms.addform.price.value.trim()=="")
				{
					alert("Invalid price");
					return false;
				}
			if(document.forms.addform.image.value.trim()=="")
			{
				alert("upload image");
				return false;
			}
		}
	</script>

	

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	
<script type="text/javascript">
 
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

<link rel="stylesheet" href="../css/style.css" type="text/css" />
</head>
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
<jsp:useBean class="shopindia.Items" id="c1"></jsp:useBean>
<%
	String mode=request.getParameter("mode");
	if(mode.equals("display"))
	{
		try
		{
			ResultSet rst=c1.display();
%>
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
				<tr>
					<td>S.No.</td>
					<td>Item Name</td>
					<td></td>
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
						String s1=c1.getCatName(rst.getInt(2));
						%>
						<td>Category</td>
						<td><%=s1 %></td>
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
						String s1=c1.getSubCatName(rst.getInt(3));
						%>
						<td>Sub Category</td>
						<td><%=s1 %></td>
						<td></td>
						<td></td>
					</tr>
<%
					}
%>
					<tr>
						<td><%=cnt %></td>
						<td><%=rst.getString(4) %></td>
						<td><form action="item.jsp?mode=change&id=<%=rst.getInt(1) %>&olditemname=<%=rst.getString(4) %>&oldcatid=<%=rst.getInt(2) %>&oldsubcatid=<%=rst.getInt(3) %>&&oldprice=<%=rst.getInt(5) %>&&olddetails=<%=rst.getString(8) %>" method="post"><input type="submit" value="change" /></form></td>
						<td><form action="item.jsp?mode=delete&id=<%=rst.getInt(1) %>" method="post"><input type="submit" value="delete" /></form></td>
						
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
			
		}
	}
	else if(mode.equals("delete"))
	{
		c1.delete(Integer.parseInt(request.getParameter("id")));
%>
		<jsp:forward page="item.jsp?mode=display"></jsp:forward>
<%			
	}
	else if(mode.equals("add"))
	{
%>		
		<form action="item.jsp?mode=addsave" method="post" name="addform"
		enctype="multipart/form-data">
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
			<td>Enter Item name to add</td>
			<td><input type="text" name="itemname"></td>
			</tr>
			<br />
			<tr>
			<td>Select Category</td><td><select name="category">
				<%
					ResultSet rst=c1.getAllCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(2) %></option>
				<%
					}
				%>
			</select></td>
			</tr>
			<br />
			<tr>
			<td>
			Select Sub Category</td><td><select name="subcategory">
				<%
					rst=c1.getAllSubCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(3) %></option>
				<%
					}
				%>
			</select></td></tr>
			
			<tr><td>Enter Price</td><td><input type="text" name="price" /></td></tr><br />
			<tr><td>Enter Details</td><td><input type="text" name="details" /><br /></td></tr>
			<tr><td>Upload Image</td><td><input type="file" name="image" /><br /></td></tr>			
			<tr><td><input type="submit" value="save" onclick="return validation1()"></td>
			<td><input type="reset" value="reset" onclick="return validation1()"></td></tr>
			</table>
			</center>
		</form>
		
<% 		
		return;
	}
	else if(mode.equals("change"))
	{
		String olditemname=request.getParameter("olditemname");
		String id=request.getParameter("id");
		int oldcatid=Integer.parseInt(request.getParameter("oldcatid"));
		int oldsubcatid=Integer.parseInt(request.getParameter("oldsubcatid"));
		int oldprice=Integer.parseInt(request.getParameter("oldprice"));
		String oldcatname=c1.getCatName(oldcatid);
		String oldsubcatname=c1.getSubCatName(oldsubcatid);
		String olddetails=request.getParameter("olddetails");
		
%>		
		<form action="item.jsp?mode=editsave&id=<%=id %>" method="post" name="changeform">
		
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr><td>Old Item name is</td><td><%=olditemname %></td></tr>
			<tr><td>Old Category name is</td><td> <%=oldcatname %><br /></td></tr>
			<tr><td>Old Sub Category name is</td><td> <%=oldsubcatname %><br /></td></tr>
			<tr><td>Enter new Item name</td><td><input type="text" name="itemname"><br /></td></tr>
			<tr><td>Select Category</td><td><select name="category">
				<%
					ResultSet rst=c1.getAllCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(2) %></option>
				<%
					}
				%>
			</select><br /></td></tr>
			<tr><td>Select Sub Category</td><td><select name="subcategory">
				<%
					rst=c1.getAllSubCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(3) %></option>
				<%
					}
				%>
			</select><br /></td></tr>
			<tr><td>Enter new price</td><td><input type="text" name="price"><br /></td></tr>
			<tr><td>Enter new details</td><td><input type="text" name="details"><br /></td></tr>
			<tr><td><input type="submit" value="save" onclick="return validation()"></td>
			<td><input type="reset" value="reset" onclick="return validation()"></td></tr>
			</table>
			</center>
		</form>
<% 		
		return;
	}
	else if(mode.equals("editsave"))
	{
		int id=Integer.parseInt(request.getParameter("id"));
		String newItemName=request.getParameter("itemname");
		String newDetails=request.getParameter("details");
		int newCatId=Integer.parseInt(request.getParameter("category"));
		int newSubCatId=Integer.parseInt(request.getParameter("subcategory"));
		int newPrice=Integer.parseInt(request.getParameter("price"));
		c1.update(id,newItemName,newCatId,newSubCatId,newPrice,newDetails);
%>
		<jsp:forward page="item.jsp?mode=display"></jsp:forward>
<%			
	}
	else if(mode.equals("addsave"))
	{
		int id=0,category=0,subcategory=0,price=0;
		String itemname="",image="",details="";
		try
		{
			shopindia.DConnection db=new shopindia.DConnection();
			ResultSet rst=db.getdata("select max(item_id) from items");
			rst.next();
			id=rst.getInt(1)+1;
		}
		catch(SQLException e){out.print(e);}
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) 
		{		
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try 
			{
				items = upload.parseRequest(request);
			} 
			catch (FileUploadException e) 
			{
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) 
			{
				FileItem item = (FileItem) itr.next();
				if (!item.isFormField())
				{
					try 
					{
						image = item.getName();
						image=id+image.substring(image.indexOf('.'),image.length());

						File savedFile = new File(config.getServletContext().getRealPath("/itemimages")+"\\"+image);
						item.write(savedFile);
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
				}
				else
				{
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString();
					if(fieldname.equals("category"))
						category=Integer.parseInt(fieldvalue);
					if(fieldname.equals("subcategory"))
						subcategory=Integer.parseInt(fieldvalue);
					if(fieldname.equals("price"))
						price=Integer.parseInt(fieldvalue);
					if(fieldname.equals("itemname"))
						itemname=fieldvalue;
					if(fieldname.equals("details"))
						details=fieldvalue;

				}
			}
		}
		c1.add(category,subcategory,itemname,price,image,details);
%>
	<jsp:forward page="item.jsp?mode=display"></jsp:forward>
<%		
	}
%>
<center>
<h2>
<a href="item.jsp?mode=add">Add New Item</a><br />
<a href="adminhome.jsp">Admin Home</a>
</h2>
</center>	
</body>
</html>