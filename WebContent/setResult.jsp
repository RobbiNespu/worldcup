<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import = "com.ssn.worldcup.model.*" %>
<html>
<body>

<% 
  String code = request.getParameter("code");
	String id = request.getParameter("id");
	String g1 = request.getParameter("g1");
	String g2 = request.getParameter("g2");
  String f = request.getParameter("final");
  Boolean finalRes = (f == null ? true : Boolean.parseBoolean(f));
  if (code.equals("qwe")) {
	  ApplicationFactory.getInstance().getModel().setResult(Integer.parseInt(id), Integer.parseInt(g1), Integer.parseInt(g2), finalRes);
  }
  response.sendRedirect("admin123.html");
%>
</body>
</html>