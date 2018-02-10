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
  <jsp:param name="menu" value="4"/>
</jsp:include>
<table height="600px"><tr valign=top ><td width=100% >
<%@ page import = "java.sql.*" %>

	<SPAN class=SIMPLE_TEXT><B>Introduceti declaratia dumneavoastra de presa</B></SPAN>
	<FORM action="setComment.jsp" method=POST>
	<INPUT name="declaration" size="80" class=ROWINP >
	<INPUT type=submit value="Salveaza declaratia de presa">
	</FORM>
	<BR/>
	<SPAN class=SIMPLE_TEXT><B>Schimba parola</B></SPAN>
	<FORM action="setNewPwd.jsp" method=POST>
	<TABLE><TR>
  <td><SPAN class=SIMPLE_TEXT>Parola veche: </SPAN></td><td><INPUT name="old" size="15" class=ROWINP type=password /></td></tr><tr>
	<td><SPAN class=SIMPLE_TEXT>Parola noua: </SPAN></td><td><INPUT name="new" size="15" class=ROWINP type=password /></td></tr><tr>
	<td><SPAN class=SIMPLE_TEXT>Confirma noua parola: </SPAN></td><td><INPUT name="confnew" size="15" class=ROWINP type=password /></td>
	</TR></TABLE>
	<INPUT type=submit value="Schimba parola"/>
	</FORM>
	
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