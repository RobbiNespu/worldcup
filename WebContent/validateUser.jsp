<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.core.persistence.*"%>
<%@ page import = "com.ssn.worldcup.model.*" %>
<%@ page import = "com.ssn.worldcup.manager.*" %>
<%@ page import = "org.hibernate.*" %>

<html>
<body>

<% 
String code = request.getParameter("code");
final String id = request.getParameter("id");

if (code.equals("qwe")) {
  new WithSessionAndTransaction() {
    @Override
    protected void executeBusinessLogic(Session session) {
      ModelManager mm = new ModelManager(session);
      User user = mm.findUserByUserName(id);
      user.setValidated(true);
    }
  }.run();
}

response.sendRedirect("admin123.html");
%>
</body>
</html>