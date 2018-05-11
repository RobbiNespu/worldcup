<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import = "com.ssn.worldcup.model.*" %>
<html>
<body>

<% 
String code = request.getParameter("code");
String id = request.getParameter("id");
String t12 = request.getParameter("t12");

if (code.equals("qwe")) {
  ApplicationFactory.getInstance().getModel().setMatchQualifiedTeam(Integer.parseInt(id), Integer.parseInt(t12)); 
}

response.sendRedirect("admin123.html");
%>
</body>
</html>