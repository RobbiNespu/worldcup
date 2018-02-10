<%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="European Football Final Tournament 2008 competition" />
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
	<LINK type="text/css" rel="stylesheet" href="css/style.css"/>
	<jsp:include page="style.jsp"/>
	<title>Settings</title>
</head>
<body onunload="confirmUnsavedChanges()">
<center>
<% 
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
	   
%>
<jsp:include page="menuHeader.jsp">
  <jsp:param name="menu" value="7"/>
</jsp:include>
<table height="600px"><tr valign=top ><td width=100% >
<%@ page import = "java.sql.*" %>
<B>Rezultate finale 2010 </B><BR/>
<IMG style="padding: 5px; border: 1px solid black" src="results/2010.gif" title="Rezultatele finale din 2010"/> <BR/>	
<B>Rezultate finale 2012 </B><BR/>
<IMG width="650px" style="padding: 5px; border: 1px solid black" src="results/2012.gif" title="Rezultatele finale din 2012"/> <BR/>
		</td>

	</tr>
	</table>
	
</td>
</tr>
<%
   } // else
%>

</center>
</body>
</html>