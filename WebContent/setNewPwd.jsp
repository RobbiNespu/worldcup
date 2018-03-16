<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.utils.*"%>
<%@ page import="java.util.*"%>
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

	String oldp = request.getParameter("old");
	String newp = request.getParameter("new");
	String confp = request.getParameter("confnew");

	if (!newp.equals(confp)) {
		response.sendRedirect("settings.jsp?alertType=E&alert=Noua parola nu a putut fi schimbata. Nu ati introdus parola noua la fel de doua ori.");		
	} else if (Utils.encrypt(oldp).equals(user.getPassword())) {
		ApplicationFactory.getInstance().getModel().changePassword(user.getUser(), oldp, newp);
		response.sendRedirect("settings.jsp?alertType=S&alert=Noua parola a fost setata.");
	} else	{
		response.sendRedirect("settings.jsp?alertType=E&alert=Noua parola nu a putut fi schimbata. Vechea parola a fost gresita.");
	}
%>

<%
   } //else
%>
</center>
</body>
</html>