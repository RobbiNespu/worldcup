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

	String oldp = request.getParameter("old");
	String newp = request.getParameter("new");
	String confp = request.getParameter("confnew");

	if (oldp.equals(Database.getInstance().getUsers().get(user).pass) &&
	    newp.equals(confp))
	{
		Database.getInstance().getUsers().get(user).pass = newp;
		Database.getInstance().save();	  
		out.write("<SPAN class=SIMPLE_TEXT>Your new password was saved.</SPAN>");
	}
	else
	{
		out.write("<SPAN class=SIMPLE_TEXT_ERROR>Your new password was not saved. Either old password was wrong or new password was different than its confirmation. </SPAN>");	  
	}
%>
<jsp:include page="settings.jsp"/>

<%
   } //else
%>
</center>
</body>
</html>