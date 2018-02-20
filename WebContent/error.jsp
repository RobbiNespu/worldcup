
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
</head>

<body>
		<%
			String error = request.getParameter("param");
		%>
	There was an unexpected error: <B><%= error %></B>	
</body>
</html>