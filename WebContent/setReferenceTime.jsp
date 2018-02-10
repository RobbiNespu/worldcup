 <%@ page import = "wmdb.*" %>
<html>
<body>
<center>
<% 
int time = Integer.parseInt(request.getParameter("time"));
Database.REFERENCE_TIME = time;
%>
</center>
</body>
</html>