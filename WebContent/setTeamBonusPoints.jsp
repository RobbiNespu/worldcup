 <%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
	String id = request.getParameter("id");
  int points = Integer.parseInt(request.getParameter("points"));

	Database.getInstance().setTeamBonusPoints(id, points);
%>
</center>
</body>
</html>