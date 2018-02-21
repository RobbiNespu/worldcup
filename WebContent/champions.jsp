
<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description"
	content="European Football Final Tournament 2010 competition" />
<LINK type="text/css" rel="stylesheet" href="wm.css" />
<LINK type="text/css" rel="stylesheet" href="css/style.css" />
<jsp:include page="style.jsp" />
<title>Bonus team</title>
</head>
<body>
	<center>
		<%
			User user = (User) (session.getAttribute("user"));

			if (user == null) {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		%>
		<jsp:include page="index.jsp" />
		<%
			} else {
		%>
		<jsp:include page="menuHeader.jsp">
			<jsp:param name="menu" value="2" />
		</jsp:include>
		<table width="100%" height="600px">
			<tr valign=top>
				<td width=100%><%@ page import="java.sql.*"%>

					<%
					boolean before = !ApplicationFactory.getInstance().getModel().getActiveTournament().getMatches().get(0)
					.isStillOpenForBets();
						if (!before) {
					%> <SPAN class=SIMPLE_TEXT>Selectati echipa bonus</SPAN> <%
 	} else {
 %> <SPAN class=SIMPLE_TEXT>Posibilitatea selectarii echipei
						bonus s-a incheiat. Urmatoarea sansa in 2020. Alegerea ta a fost:</SPAN>
					<%
						}
					%>

					<FORM action="setChampions.jsp" method=POST>
						<%
							out.write("<select name=\"teamid\" " + (!before ? "" : "disabled='true'") + ">");

								List<Team> teams = ApplicationFactory.getInstance().getModel().getTeamsForActiveTournament();
								Tournament tour = ApplicationFactory.getInstance().getModel().getActiveTournament();
								User user2 = ApplicationFactory.getInstance().getModel().getUserByName(user.getUser());
								WinningTeamForecast wtf = user2.getWinningTeamForecast(tour);
								String teamid = (wtf != null ? wtf.getTeam().getName() : "");

								out.write("<option value=\"\" " + (teamid == null || teamid.length() == 0 ? "selected" : "") + ">--");
								for (Team team : teams) {
									out.write("<option value=\"" + team.getName() + "\" "
											+ ((team.getName().equals(teamid)) ? "selected" : "") + ">" + team.getName());
								}
								out.write("</select>");
						%>

						<%
							if (!before) {
						%>
						<INPUT type="submit" value="Salveaza">
						<%
							}
						%>
					</FORM></td>

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