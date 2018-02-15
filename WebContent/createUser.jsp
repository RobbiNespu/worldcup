<%@ page import="com.ssn.core.*"%>
<html>
<body>
	<% 
  //Database.getInstance().log(request.getRemoteAddr()+" createUser.jsp");
  String user = request.getParameter("user");
  String password = request.getParameter("password");
  String password2=request.getParameter("confirmPassword");
  String email = request.getParameter("email");

  if (user!=null)
  {
	  if(password==password2){

			boolean result = ApplicationFactory.getInstance().getModel().createUser(user, password, email);

			if (result)
			{
			out.write("<SPAN class=SIMPLE_TEXT>User " + user + " created. </SPAN>");
		
			%>
	<jsp:include page="index.jsp" />
	<%
			}
			else
		{
			out.write("<SPAN class=SIMPLE_TEXT_ERROR>Cannot create user " + user + ". User or email already exists.</SPAN>");
			%>
	<jsp:include page="signin.jsp" />
	<%
		}
	  }else{
		  %>
		  alert("different passwords were chosen")
	  
	  <% }
  }

%>

</body>
</html>