<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import = "com.ssn.worldcup.model.*" %>
<html>
<body>

<% 
	String id = request.getParameter("id");
	String g1 = request.getParameter("g1");
	String g2 = request.getParameter("g2");
	ApplicationFactory.getInstance().getModel().setResult(Integer.parseInt(id), Integer.parseInt(g1), Integer.parseInt(g2));
%>
</body>
</html>