<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="org.apache.logging.log4j.*"%> 

<html>
<body>

  <%@ page import="java.sql.*"%>
  <%
    //Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
    final Logger logger = LogManager.getLogger("setChampions.jsp");

    User user = (User) (session.getAttribute("user"));

    if (user == null) {
      response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
    } else {

      String teamid = request.getParameter("teamid");

      ApplicationFactory.getInstance().getModel().setBonusTeam(user.getUser(), teamid);
      logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + ", team: " + teamid + " SUCCESS");
      response.sendRedirect("champions.jsp?alertType=S&alert=Echipa ta bonus a fost salvata.");
  %>

  <%
    } //else
  %>
  </center>
</body>
</html>