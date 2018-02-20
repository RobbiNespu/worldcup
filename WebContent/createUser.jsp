<%@ page import="com.ssn.core.*, com.ssn.worldcup.model.*"%>
<html>
<body>
	<%
		//Database.getInstance().log(request.getRemoteAddr()+" createUser.jsp");
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		String password2 = request.getParameter("confirmPassword");
		String email = request.getParameter("email");

		if (user != null) {
			if (password.equals(password2)) {

				boolean result = ApplicationFactory.getInstance().getModel().createUser(user, password, email);

				if (result) {
					User u = ApplicationFactory.getInstance().getModel().getUserByName(user);
					
					String serverIP = request.getLocalAddr();
					int serverPort = request.getLocalPort();
					ApplicationFactory.getInstance().getModel().getMail().sendMessage(u, serverIP, serverPort);
					
					out.write("<SPAN class=SIMPLE_TEXT>User " + user + " created. </SPAN>");
	%>
	<jsp:include page="index.jsp" />
	<%
		} else {
					out.write("<SPAN class=SIMPLE_TEXT_ERROR>Cannot create user " + user
							+ ". User or email already exists.</SPAN>");
	%>
	<jsp:include page="signin.jsp" />
	<%
		}
			} else {
	%>
	alert("different passwords were chosen")
	<%=password%>
	<%=password2%>

	<%
		}
		}
	%>

</body>
</html>