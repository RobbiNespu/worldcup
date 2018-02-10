  <%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
	Database.getInstance().log(request.getRemoteAddr()+" setMatchQualifiedTeam.jsp");
	String id = request.getParameter("id");
	String team = request.getParameter("team");

	Database.getInstance().setMatchQualifiedTeam(id, team); 
	Database.getInstance().save();
%>
</center>
</body>
</html>