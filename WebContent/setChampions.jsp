<%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
  String user = (String)(session.getAttribute("user"));

  if (user==null)
  {
	  out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
	  %>
		  <jsp:include page="index.jsp"/>
	  <%
	    }
	     else
	     {

	  	String teamid = request.getParameter("teamid");

	  	Database.getInstance().setBonusTeam(user, teamid);
	  	out.write("<SPAN class=SIMPLE_TEXT>Your data was saved.</SPAN>");
	  %>
<jsp:include page="champions.jsp"/>

<%
   } //else
%>
</center>
</body>
</html>