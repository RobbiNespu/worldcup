<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.*"%>
<html>
<body>

  <%
    User user = (User) (session.getAttribute("user"));

    if (user == null) {
      response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
    } else {

      String decl = request.getParameter("declaration");

      ApplicationFactory.getInstance().getModel().setUserComment(user, decl);
      response.sendRedirect("declarations.jsp?alertType=S&alert=Comentariul tau a fost salvat");
  %>

  <%
    } //else
  %>
  </center>
</body>
</html>