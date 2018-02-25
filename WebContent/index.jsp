<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import = "com.ssn.core.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="" />
	<LINK type="text/css" rel="stylesheet" href="css/style.css"/>
	<jsp:include page="style.jsp"/>
	<title><%= ApplicationFactory.getInstance().getModel().getActiveTournament().toString() %></title> 
</head>
<body onload="document.all['user'].focus()">
<center>
<form action="login.jsp" method="post">
<table cellspacing=0 border=0>
<tr >
<td colspan=2>
<A><img width="700px"  src="img/header1.png"/></a>
</td>
</tr>
<tr><td><br/></td></tr>
<tr>
<td class=SIMPLE_TEXT>
<br>
</td>
<td align=left >
  <input required='' name="user"  type='text' >
  <label alt="User" placeholder='User'></label>
</td>
<tr>
<td class=SIMPLE_TEXT>
<br>
</td>
<td align=left width="400px">
  <input required='' name="password"  type='password' >
  <label alt="Password" placeholder='Password'></label>
</td>
</tr>
<tr><td><br/></td></tr>
<tr >
<td class=SIMPLE_TEXT_CENTERED colspan="2">
  <input type="submit"  value="Login" />
</td>
</tr>
<tr><td><br/><br/></td></tr>
<tr>
<td class=SIMPLE_TEXT_CENTERED colspan="2" align="center">
  New user? <a href="signin.jsp">Sign in</a>
</td>
</tr>
<tr>
<td class=SIMPLE_TEXT_CENTERED colspan="2" align="center">
  Registered users: <B> <%=ApplicationFactory.getInstance().getModel().getUsers().size()%> </B>
</td>
</tr>
<tr><td colspan="2" align="center">
<IMG src="img/cupa.jpg" height="300" width="400"></img>
<br/>

<SPAN class=FCELL style='text-color:gray;'>Server time: 
<%java.util.Date d = new java.util.Date();
out.write(d.toString());
%>
</SPAN>
</td></tr>
</table>
</form>
</center>

</body>
</html>