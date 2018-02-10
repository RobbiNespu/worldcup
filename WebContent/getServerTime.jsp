<%@ page import = "java.util.*" %>
<%@ page import = "wmdb.*" %>
<html>
<body>
<center>
<% 
Date d = new Date(System.currentTimeMillis()+Database.REFERENCE_TIME*60*60*1000);
out.write(d.toString());
%>
</center>
</body>
</html>