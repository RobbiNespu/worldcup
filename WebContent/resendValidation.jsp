
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.core.utils.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
</head>

<body>
		<%
			String name = request.getParameter("user");
			User user = ApplicationFactory.getInstance().getModel().getUserByName(name);
			ApplicationFactory.getInstance().getModel().getMail().sendMessage(user, Utils.getServerHostName(), request.getLocalPort());
		%>
	<B>A new validation email was sent. Please check your inbox. <A href="index.jsp">Login</A></B>	
</body>
</html>