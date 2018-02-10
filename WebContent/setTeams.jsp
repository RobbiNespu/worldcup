 <%@ page import = "wmdb.*" %>
<%@page import="java.util.*"%>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
	String id = request.getParameter("id");
	String t1 = request.getParameter("t1");
	String t2 = request.getParameter("t2");

	Match m = Database.getInstance().getMatch(id);
	m.t1 = t1;
	m.t2 = t2;
	Database.getInstance().save();
%>
</center>
</body>
</html>