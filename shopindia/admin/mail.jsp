<html>
<head>
<title>JSP JavaMail Example </title>
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

<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%   
{
	
	String title="",mymsg="";
	String mode=request.getParameter("mode");
	String email="",pass="";	
	email=request.getParameter("email");
	if(mode.equals("newaccount"))
	{		
		pass=request.getParameter("pass");
		title="Message from shopindia";
		mymsg="your account has been opened with the id " + email + " and the password is " + password "+ pass;
	}
	else if(mode.equals("queryresp"))
	{
		String resp=request.getParameter("resp") ;
		out.print(resp);
		String query=request.getParameter("query");
		title="Message from shopindia" ;
		mymsg="Response to your query '"+query+"' is: "+resp ;
		out.print(mymsg);
	}
	else if(mode.equals("query"))
	{		
		query=request.getParameter("query");
		title="Message from shopindia";
		mymsg="your query '"+query+"' has been received and will be processed soon.";
	}
	else //bill
	{
		int amt=Integer.parseInt(request.getParameter("amt"));
		title="bill from shopindia";
		mymsg="Your goods including the invoice has been dispatched & amount you have to pay is " + amt;
	 }
	String host = "smtp.gmail.com";
	String from = "shopindia123";//dummy mail 
	String pass = "12345";//dummy pass
	Properties props = System.getProperties();
	props.put("mail.smtp.starttls.enable", "true"); 
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.user", from);
	props.put("mail.smtp.password", pass);
	props.put("mail.smtp.port", "587");
	props.put("mail.smtp.auth", "true");
	String[] to =new String[1];
	to[0]=email;
	Session session2 = Session.getDefaultInstance(props, null);
	MimeMessage message = new MimeMessage(session2);
	message.setFrom(new InternetAddress(from));
	InternetAddress[] toAddress = new InternetAddress[to.length];
	
 
	// To get the array of addresses
	for( int i=0; i < to.length; i++ ) 
	{ 
		// changed from a while loop
		toAddress[i] = new InternetAddress(to[i]);
	}
 
 	for( int i=0; i < toAddress.length; i++) 
	{ 
		// changed from a while loop
		message.addRecipient(Message.RecipientType.TO, toAddress[i]);
	}
	message.setSubject(title);
	message.setText(mymsg);
	Transport transport = session2.getTransport("smtp");
	transport.connect(host, from, pass);
	transport.sendMessage(message, message.getAllRecipients());
	transport.close();
	if(mode.equals("newaccount"))
		response.sendRedirect("login.jsp");                  
	else
		response.sendRedirect("logout.jsp");                  
}
%>
</table>
</body>
</html>
