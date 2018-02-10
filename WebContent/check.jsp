 <%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
<%
out.write(Database.getInstance().users.toString());
%>