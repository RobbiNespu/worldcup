<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.utils.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.logging.log4j.*"%> 

<html>
<body>

  <%
    final Logger logger = LogManager.getLogger("setNewPwd.jsp");
    User user = (User) (session.getAttribute("user"));

    if (user == null) {
      response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
    } else {

      String oldp = request.getParameter("old");
      String newp = request.getParameter("new");
      String confp = request.getParameter("confnew");

      if (!newp.equals(confp)) {
        logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + " FAILED");
        response.sendRedirect("settings.jsp?alertType=E&alert=Noua parola nu a putut fi schimbata. Nu ati introdus parola noua la fel de doua ori.");
      } else if (Utils.encrypt(oldp).equals(user.getPassword())) {
        ApplicationFactory.getInstance().getModel().changePassword(user.getUser(), oldp, newp);
        logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + " SUCCESS");
        response.sendRedirect("settings.jsp?alertType=S&alert=Noua parola a fost setata.");
      } else {
        logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + " FAILED 2");
        response.sendRedirect("settings.jsp?alertType=E&alert=Noua parola nu a putut fi schimbata. Vechea parola a fost gresita.");
      }
  %>

  <%
    } //else
  %>
  </center>
</body>
</html>