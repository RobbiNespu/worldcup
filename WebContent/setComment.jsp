<%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<% 
Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
  String user = (String)(session.getAttribute("user"));

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

	Database.getInstance().getUsers().get(user).comment = decl;
	Database.getInstance().save();
	out.write("<SPAN class=SIMPLE_TEXT>Your comment was saved.</SPAN>");
%>
<jsp:include page="settings.jsp"/>

<%
   } //else
%>
</center>
</body>
</html>