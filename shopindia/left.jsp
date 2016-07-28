<%@ page import="java.sql.*"%>
<%
	shopindia.DConnection db=new shopindia.DConnection();
	String item=request.getParameter("item");
	if(item!=null)
		item=item.trim();
	String price=request.getParameter("price");
	if(price==null || price.equals(""))
		price="All";
	ResultSet rst=null;
	String catstr="",subcatstr="";
	String cat[]=request.getParameterValues("category");
	String subcat[]=request.getParameterValues("subcategory");
	if(cat!=null && cat.length!=0)
	{
		catstr="(";
		for(int i=0;i<cat.length;i++)
		catstr+=(cat[i]+",");
		catstr=catstr.substring(0,catstr.length()-1);
		catstr+=")";
	}
	if(subcat!=null && subcat.length!=0)
	{
		subcatstr="(";
		for(int i=0;i<subcat.length;i++)
			subcatstr+=(subcat[i]+",");
		subcatstr=subcatstr.substring(0,subcatstr.length()-1);
		subcatstr+=")";
	}
/*	int cnt=0,totalbill=0;
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
	}*/
%>

      <!-- Search -->
      <div class="box search">
        <h2>Search by <span></span></h2>
        <div class="box-content">
          <form action="index.jsp" method="post">
            <label>Item name</label>
            <input type="text" class="field" name="item" />
            <h1><label>Category</label></h1>
<%
	try
	{
		rst=db.getdata("select * from category");
		while(rst.next())
		{
			boolean found=false;
			if(cat!=null)
			{
				for(int i=0;i<cat.length;i++)
				{
					if(rst.getInt(1)==Integer.parseInt(cat[i]))
					{
						found=true;
						break;
					}
				}
			}
			if(found==true)
			{
%>
			<h2><input type="checkbox" name="category" value="<%=rst.getInt(1)%>" checked="checked"/><%=rst.getString(2)%></h2><br />
<%
			}
			else
			{
%>
			<h2><input type="checkbox" name="category" value="<%=rst.getInt(1)%>" /><%=rst.getString(2)%></h2><br />

<%			
			}
		}
%>
<p>
<h1><label>Sub Category</label></h1>
<%
		rst=db.getdata("select * from subcategory");
		while(rst.next())
		{
			boolean found=false;
			if(subcat!=null)
			{
				for(int i=0;i<subcat.length;i++)
				{
					if(rst.getInt(1)==Integer.parseInt(subcat[i]))
					{
						found=true;
						break;
					}
				}
			}
			if(found==true)
			{
%>
			<h2><input type="checkbox" name="subcategory" value="<%=rst.getInt(1)%>" checked="checked" /><%=rst.getString(3)%></h2><br />
<%
			}
			else
			{
%>
			<h2><input type="checkbox" name="subcategory" value="<%=rst.getInt(1)%>" /><%=rst.getString(3)%></h2><br />
<%
			}	
		}		
	}
	catch(SQLException e)
	{
		out.print(e);
	}
	
%>


            <div class="inline-field">
              <label>Price</label>
              <select name="price" style="width:150px;" class="field small-field">

<%
	if(price.equals("All"))
	{
%>
		<option value="All" selected="selected">All</option>
<%
	}
	else
	{
%>
		<option value="All">All</option>		
<%
	}
	if(price.equals("Rs 1 to 1000"))
	{
%>
		<option value="Rs 1 to 1000" selected="selected">Rs 1 to 1000</option>
<%
	}
	else
	{
%>
		<option value="Rs 1 to 1000">Rs 1 to 1000</option>		
<%
	}
	if(price.equals("Rs 1001 to 2000"))
	{
%>
		<option value="Rs 1001 to 2000" selected="selected">Rs 1001 to 2000</option>
<%
	}
	else
	{
%>
		<option value="Rs 1001 to 2000">Rs 1001 to 2000</option>		
<%
	}
	if(price.equals("Rs 2001 to 5000"))
	{
%>
		<option value="Rs 2001 to 5000" selected="selected">Rs 2001 to 5000</option>
<%
	}
	else
	{
%>
		<option value="Rs 2001 to 5000">Rs 2001 to 5000</option>		
<%
	}
	if(price.equals("Rs 5001 & above"))
	{
%>
		<option value="Rs 5001 & above" selected="selected">Rs 5001 & above</option>
<%
	}
	else
	{
%>
		<option value="Rs 5001 & above">Rs 5001 & above</option>		
<%
	}
%>
              </select>
            </div>
            <input type="submit" class="search-submit" value="Filter" />
          </form>
        </div>
    	<div id="facebookdet">
		<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1610631505857566',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

	</div>

      </div>
      <!-- End Search -->
