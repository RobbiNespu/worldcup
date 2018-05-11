<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import = "com.ssn.worldcup.model.*" %>
<html>
<body>

<% 
  String code = request.getParameter("code");
	String id = request.getParameter("id");
	String t1 = request.getParameter("t1");
	String t2 = request.getParameter("t2");

  if (code.equals("qwe")) {
    ApplicationFactory.getInstance().getModel().setMatchTeams(Integer.parseInt(id), t1, t2); 
  }
  
  response.sendRedirect("admin123.html");
  
%>
</body>
</html>