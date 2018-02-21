<%@ page import = "com.ssn.worldcup.model.*" %>
<%@ page import = "com.ssn.core.*" %>
<html>
<body>

<% 
  User user = (User)(session.getAttribute("user"));

  if (user==null)
  {
	  out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
	  %>
		  <jsp:include page="index.jsp"/>
	  <%

   }
   else
   {

	String decl = request.getParameter("declaration");

	ApplicationFactory.getInstance().getModel().setUserComment(user, decl);
	out.write("<SPAN class=SIMPLE_TEXT>Your comment was saved.</SPAN>");
%>
<jsp:include page="settings.jsp"/>

<%
   } //else
%>
</center>
</body>
</html>