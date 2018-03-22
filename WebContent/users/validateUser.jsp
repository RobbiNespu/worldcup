
<%@page import="com.ssn.worldcup.model.*, com.ssn.core.*"%>
<html>
<body>
<%
			String stringUser = request.getParameter("user");
			String code = request.getParameter("vc");
			

			User user = ApplicationFactory.getInstance().getModel().getUserByName(stringUser);
				if(user.isValidated()){
					out.write(
							"<SPAN class=SIMPLE_TEXT_ERROR>Your account is already validated. Please proceed to login");
					Thread.sleep(3000);
					response.sendRedirect("../index.jsp");
				}else{
		
			if (user != null && code.equals(user.getValidationCode())) {
				ApplicationFactory.getInstance().getModel().setUserActivated(user,true);
				session.setAttribute("user", user);
				out.write(
						"<SPAN class=SIMPLE_TEXT_ERROR>Your account is now validated. Good luck!");
				Thread.sleep(3000);
				response.sendRedirect("../classification.jsp");
			}
				}
		%>
		</body>
		</html>