<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<% 
  String user = (String)(session.getAttribute("user"));
  session.invalidate();
	  %>
		  <jsp:include page="index.jsp"/>
	  <%
%>


</td>
</tr>

</body>
</html>