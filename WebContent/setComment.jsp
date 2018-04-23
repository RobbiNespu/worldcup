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
	response.sendRedirect("declarations.jsp?alertType=S&alert=Comentariul tau a fost salvat");
%>

<%
   } //else
%>
</center>
</body>
</html>