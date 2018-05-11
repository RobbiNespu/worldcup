
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%
			String user = request.getParameter("user");
			String pass = request.getParameter("password");
			String ip = request.getRemoteAddr();

			User theUser = ApplicationFactory.getInstance().getModel().checkLogin(user, pass);

			if (theUser != null) {
				if (theUser.isValidated()) {
					session.setAttribute("user", theUser);
		%>
<%
			response.sendRedirect("classification.jsp");
		%>
<%
			} else { %>
<%
				//response.sendRedirect("index.jsp?alertType=E&alert=Contul tau nu a fost inca validat. Nu uita sa dai reply la emailul de validare.");
        response.sendRedirect("resendActivationCode.jsp?alertType=E&alert=Contul tau nu a fost inca validat. Nu uita sa dai reply la emailul de validare.");
			}

			} else {
				response.sendRedirect("index.jsp?alertType=E&alert=User invalid sau parola gresita.");
			}
		%>

</body>
</html>