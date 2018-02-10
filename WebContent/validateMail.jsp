<%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<% 
  String user = (String)(request.getParameter("user"));  
  User u = Database.getInstance().getUsers().get(user);  
%>
Hello, <%=u.name%>

To validate your EURO2008 competition account please visit the following link:

http://79.118.53.173/wmdb/validate.jsp?vid=<%=u.internalCode%>

Thank you.