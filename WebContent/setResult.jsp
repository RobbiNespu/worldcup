  <%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
	Database.getInstance().log(request.getRemoteAddr()+" setResult.jsp");
	String id = request.getParameter("id");
	String g1 = request.getParameter("g1");
	String g2 = request.getParameter("g2");

	Database.getInstance().setMatchResult(id, g1, g2); 
	Database.getInstance().save();
%>
</center>
</body>
</html>