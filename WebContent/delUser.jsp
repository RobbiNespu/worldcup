<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import = "com.ssn.worldcup.model.*" %>

<html>
<body>

<% 
String code = request.getParameter("code");
String id = request.getParameter("id");

if (code.equals("qwe")) {
  ApplicationFactory.getInstance().getModel().removeUser(id);  
}

response.sendRedirect("admin123.html");
%>
</body>
</html>