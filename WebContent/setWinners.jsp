<%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
	String id = request.getParameter("id");

	//Database.getInstance().winningTeam = id;
%>
</center>
</body>
</html>