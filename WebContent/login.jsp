
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description" content="2014 competition" />
</head>

<body>
	<center>
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
			response.sendRedirect("settings.jsp");
		%>
		<%
			} else {
					out.write(
							"<SPAN class=SIMPLE_TEXT_ERROR>Your account was not validated yet. Please reply to the validation mail. ");
					out.write("<a href=\"index.jsp\">Try again</a> or <a href=\"resendValidation.jsp?user="+user+"\">resend validation mail</a></SPAN>");
				}

			} else {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>Unknown user or wrong password. ");
				out.write("<a href=\"index.jsp\">Try again</a></SPAN>");
			}
		%>
	
</body>
</html>