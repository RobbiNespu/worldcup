 <%@ page import = "com.ssn.core.*" %>
<%@ page import = "java.util.*" %>
<%
out.write(ApplicationFactory.getInstance().getModel().getUsers().toString());
%>
