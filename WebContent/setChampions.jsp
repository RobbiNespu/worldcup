<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<html>
<body>

  <%@ page import="java.sql.*"%>
  <%
    //Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
    User user = (User) (session.getAttribute("user"));

    if (user == null) {
      response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
    } else {

      String teamid = request.getParameter("teamid");

      ApplicationFactory.getInstance().getModel().setBonusTeam(user.getUser(), teamid);
      response.sendRedirect("champions.jsp?alertType=S&alert=Echipa ta bonus a fost salvata.");
  %>

  <%
    } //else
  %>
  </center>
</body>
</html>