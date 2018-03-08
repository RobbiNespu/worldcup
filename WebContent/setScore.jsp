<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<html>
<body>
	<div style="text-align: center">

		<%@ page import="java.util.*"%>
		<%
			User user = (User) (session.getAttribute("user"));

			if (user == null) {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		%>
		<jsp:include page="index.jsp" />
		<%
			} else {

				boolean result = true;
				for (int i = 1; i <= 64; i++) {
					String ch = request.getParameter("ch" + i);
					String fa = request.getParameter("fa" + i);
					String fb = request.getParameter("fb" + i);

					if (ch != null && ch.equals("true") && fa != null && fb != null && !fa.equals("")
							&& !fb.equals("")) {
						try {
							boolean res = ApplicationFactory.getInstance().getModel().setForecast(user, i,
									Integer.parseInt(fa), Integer.parseInt(fb));
							if (!res) {
								result = false;
							}
						} catch (NumberFormatException ex) {
							//        
						}
					}
				}

				if (!result) {
					out.write("<SPAN class=SIMPLE_TEXT_ERROR>Unable to save your result.</SPAN>");
				} else {
					out.write("<SPAN class=SIMPLE_TEXT>Your data was saved.</SPAN>");
				}
				response.sendRedirect("forecasts.jsp?alertType=S&alert=Your scores were successfully saved in the database.");
		%>

		<%
			} // else
		%>

	</div>
</body>
</html>