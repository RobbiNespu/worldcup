<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.logging.log4j.*"%> 
<html>
<body>
  <div style="text-align: center">

    <%@ page import="java.util.*"%>
    <%
      final Logger logger = LogManager.getLogger("setScore.jsp");
      User user = (User) (session.getAttribute("user"));

      if (user == null) {
        response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");

      } else {

        boolean result = true;
        for (int i = 1; i <= 64; i++) {
          String ch = request.getParameter("ch" + i);
          String fa = request.getParameter("fa" + i);
          String fb = request.getParameter("fb" + i);

          if (ch != null && ch.equals("true") && fa != null && fb != null && !fa.equals("") && !fb.equals("")) {
            try {
              boolean res = ApplicationFactory.getInstance().getModel().setForecast(user, i, Integer.parseInt(fa), Integer.parseInt(fb));
              if (!res) {
                result = false;
                logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + ", Match: " + i + ": " + fa + " - " + fb + " FAILED");                
              } else {
                logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + ", Match: " + i + ": " + fa + " - " + fb + " SUCCESS");                
              }
            } catch (NumberFormatException ex) {
              logger.info("IP: " + request.getRemoteAddr() + " User " + user.getUser() + ", Match: " + i + ": " + fa + " - " + fb + " FAILED [NFEx]");                
              //        
            }
          }
        }

        response.sendRedirect("forecasts.jsp?alertType=S&alert=Scorurile tale au fost salvate cu succes in baza de date.");
    %>

    <%
      } // else
    %>

  </div>
</body>
</html>