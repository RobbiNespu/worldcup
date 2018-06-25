<%@page import="com.ssn.core.ApplicationFactory"%>
<%@page import="com.ssn.core.persistence.*"%>
<%@page import="com.ssn.core.utils.*"%>
<%@page import="org.hibernate.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.worldcup.manager.*"%>
<%@ page import="java.util.*"%>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<%
if (request.getParameter("code").equals("qwe")) {
final String t = request.getParameter("team");
Team team = new WithSessionAndTransaction<Team>() {  

  @Override
  protected void executeBusinessLogic(Session sess) {
    ModelManager tm = new ModelManager(sess);
    Team team = tm.findTeamByName(t);
    team.setEliminated(true);
  }

}.run();
}

%>
</center>
</body>
</html>