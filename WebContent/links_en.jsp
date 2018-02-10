<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="European Football Final Tournament 2008 competition" />
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
	<title>Rules</title>
</head>
<body>
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
<table cellspacing=0 class=SIMPLE_TEXT_CENTER width=700px >
<tr>
<td colspan=6>
<A><img src="header.PNG"/></a>
</td>
</tr>
<tr>
<td width="125px" class=MENU>
  <a href="classification.jsp">Hall of Fame</a>
</td>
<td width="125px" class=MENU>
  <a href="forecasts.jsp">Forecasts</a>
</td>
<td width="125px" class=MENU>
  <a href="champions.jsp">Bonus team</a>
</td>
<td width="125px" class=SEL_MENU>
  <a href="links.jsp">Rules</a>
</td>
<td width="125px" class=MENU>
  <a href="settings.jsp">Settings</a>
</td>
<td width="125px" class=MENU>
  <a href="logout.jsp">Logout</a>
</td>
</tr>
<tr>
<td colspan=6 class=SIMPLE_TEXT_LEFT><table><tr valign=top ><td width=100%>
The rules are simple:
<br/>
<ul>
<li>1 point for guessing only the winning team, but not the score </li>
<li>3 points for guessing a correct score.</li>
<li>Extra bonus points for guessing a correct score with more than 3 goals. (1 point for 4 goals, 2 points for 5 goals, 3 points for 6 goals and so on...)</li>
<li>Bonus team: Choose a bonus team and you will get bonus points for this team's results:
<ul>
<li>1 bonus point for each victory in the group</li>
<li>1 bonus point for qualifying from group stage</li>
<li>1 bonus point for qualifying to quarter finals</li>
<li>2 bonus points for qualifying to semifinals</li>
<li>3 bonus points for qualifying to final</li>
<li>5 bonus points for winning the competition</li>
</ul>
</li>
</ul>
You can enter your score until 15 minutes before the start of the game. You can select the Euro 2008 winners until the beginning of the first match in the tournament.
<br/>
In case of points equality <B>at the end of the competition</B> the winner will be determined based on the following criteria in the given order:
<ul>
<li>Higher number of correct scores
<li>Higher number of bonus points
<li>Higher number of points obtained in the match 31
<li>Higher number of points obtained in the match 30
<li>... and so on until a difference is found
</ul>
<br/>
<br/>

</td>
	<td align="right" valign="top" width="150px">
	  <jsp:include page="comments.jsp"/>
</td>
	</tr>
	</table>


</td>
</tr>
</table>
<%
   } //else
%>
</center>
</body>
</html>