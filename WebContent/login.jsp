
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="org.apache.logging.log4j.*"%> 

<%
final Logger logger = LogManager.getLogger("login.jsp");

			String user = request.getParameter("user");
			String pass = request.getParameter("password");
			String ip = request.getRemoteAddr();

			User theUser = ApplicationFactory.getInstance().getModel().checkLogin(user, pass);

			if (theUser != null) {
				if (theUser.isValidated()) {
          logger.info("IP: " + request.getRemoteAddr() + " User " + theUser.getUser() + " login SUCCESS");
					session.setAttribute("user", theUser);
		%>
<%
			response.sendRedirect("classification.jsp");
		%>
<%
			} else { %> 
          logger.info("IP: " + request.getRemoteAddr() + " User " + theUser.getUser() + " login FAILED not validated");
<%
				//response.sendRedirect("index.jsp?alertType=E&alert=Contul tau nu a fost inca validat. Nu uita sa dai reply la emailul de validare.");
        response.sendRedirect("index.jsp?alertType=E&alert=Contul tau nu a fost inca validat. Nu uita sa dai reply la emailul de validare.");
			}

			} else {
        logger.info("IP: " + request.getRemoteAddr() + " User " + theUser.getUser() + " login FAILED invalid user or pwd");
				response.sendRedirect("index.jsp?alertType=E&alert=User invalid sau parola gresita.");
			}
		%>

</body>
</html>