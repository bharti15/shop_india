<html>
<head>
</head>
<body>
<%
      String bank=request.getParameter("bank");
      if("sbi".equals(bank))
      {
          response.sendRedirect("https://www.onlinesbi.com/");
      }
      else if("icici".equals(bank))
      {
          response.sendRedirect("https://b2.icicibank.co.in");
      }
      else if("pnb".equals(bank))
      {
          response.sendRedirect("https://netbanking.netpnb.com");
      }
      else if("hdfc".equals(bank))
      {
          response.sendRedirect("https://netbanking.hdfcbank.com/netbanking/");
      }
%>
</body>
</html>