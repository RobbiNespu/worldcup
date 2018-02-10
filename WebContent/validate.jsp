<%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
  String vid = (String)(request.getParameter("vid"));  

  if (vid==null)
  {
	  out.write("<SPAN class=SIMPLE_TEXT_ERROR>null validation code</SPAN>");
	  %>
		  <jsp:include page="index.jsp"/>
	  <%
   }
   else
   {
	    boolean result = Database.getInstance().validateUser(vid);
			if (result	)
			{
			  %>
<SPAN class=SIMPLE_TEXT>Thank you for validation. You can login now to your account.</SPAN>
<jsp:include page="index.jsp"/>
			  <%
			  
			} else // 2
			{
	  			out.write("<SPAN class=SIMPLE_TEXT_ERROR>Validation failed</SPAN>");
	  			%>
	  		  <jsp:include page="index.jsp"/>
	  		  <%
			} //else 2
   } // else
%>

</center>
</body>
</html>