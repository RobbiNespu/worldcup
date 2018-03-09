<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<% 
  session.invalidate();
  response.sendRedirect("index.jsp?alertType=S&alert=Ati fost delogat cu succes.");
%>


</td>
</tr>

</body>
</html>