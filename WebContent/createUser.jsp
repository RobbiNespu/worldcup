<%@ page
	import="com.ssn.core.*, com.ssn.worldcup.model.*, com.ssn.core.utils.*"%>
<html>
<body>
	<%
		//Database.getInstance().log(request.getRemoteAddr()+" createUser.jsp");
		try {
			String user = request.getParameter("userSI");
			String password = request.getParameter("passwordSI");
			String password2 = request.getParameter("repeatPassword");
			String email = request.getParameter("email");

			if (user != null) { 
				if (password.equals(password2)) {

					User tempUser = ApplicationFactory.getInstance().getModel().getUserByNameOrEmail(user, email);

					if (tempUser == null) {
						String serverIP = Utils.getServerHostName();
						int serverPort = request.getLocalPort();
						User u = ApplicationFactory.getInstance().getModel().createUser(user, password, email);
						if (ApplicationFactory.getInstance().getModel().getMail() == null) {
							throw new RuntimeException("Server configuration error");
						}
		        String SERVER_AND_PORT = getServletContext().getInitParameter("serverAddress");
            
            String message = 
            "Salut, " + user + "!" + System.lineSeparator() + //
            "Pentru a-ti valida contul la WorldCup 2018 apasa pe urmatorul link:" + System.lineSeparator() + //
            "http://" + SERVER_AND_PORT + "/worldcup/users/validateUser.jsp?user=" + user.trim() + "&vc=" + u.getValidationCode().trim() + System.lineSeparator() + // 
            "Succes!";

            try {
						  ApplicationFactory.getInstance().getModel().getMail().sendMessage(u, message);
            } catch (Throwable ex) {
              throw new RuntimeException("Could not send validation email");
            }

						out.write("<SPAN class=SIMPLE_TEXT>User " + user + " created. </SPAN>");
	response.sendRedirect("index.jsp?alertType=S&alert=User-ul a fost creat. Valideaza-ti adresa de email.");
	%>
	<%
		} else {
						out.write("<SPAN class=SIMPLE_TEXT_ERROR>Cannot create user " + user
								+ ". User or email already exists.</SPAN>");
	response.sendRedirect("index.jsp?alertType=E&alert=User-ul nu a putut fi creat. Adresa de mail sau user-ul mai exista.");
	%>
	<%
		}
			} else {
	%>
	alert("different passwords were chosen");
	<%=password%>
	<%=password2%>

	<%
		}
			}
		} catch (Exception ex) {
			out.write(ex.getMessage());
			response.sendRedirect("index.jsp?alert=Error: "+ex.getMessage()+"&alertType=E");
		}
	%>

</body>
</html>