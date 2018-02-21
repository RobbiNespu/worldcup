<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.core.utils.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<LINK type="text/css" rel="stylesheet" href="wm.css" />
<LINK type="text/css" rel="stylesheet" href="css/style.css" />
<jsp:include page="style.jsp" />
<script type="text/javascript" language="javascript" src="js/script.js"></script>
<title>Forecasts</title>

<script language="JavaScript">
	window.onbeforeunload = confirmExit;
	var dataChanged = false;
	function confirmExit() {
		if (dataChanged) {
			return "Nu ati salvat ultimele scoruri introduse!";
		}
	}
</script>

</head>


<body>
	<center>
		<%
			User user = (User) (session.getAttribute("user"));
			user = ApplicationFactory.getInstance().getModel().getUserByName(user.getUser());
			Tournament tour = ApplicationFactory.getInstance().getModel().getActiveTournament();

			DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.ENGLISH);

			if (user == null) {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		%>
		<jsp:include page="index.jsp" />
		<%
			} else {
		%>
		<jsp:include page="menuHeader.jsp">
			<jsp:param name="menu" value="1" />
		</jsp:include>
		<table width=100% onmouseout="tooltip.hide();return;hideDiv();">
			<tr valign=top>
				<td>
					<%
						out.write("<form action=setScore.jsp method=POST>");
							out.write(
									"<input type=submit value='Salveaza' onclick='dataChanged = false;'/><SPAN class=SIMPLE_COMMENT>&nbsp;Nu uitati sa apasati butonul <B>Salveaza</B>  dupa ce ati editat scorurile, pentru a le salva in baza de date!!!</SPAN>");
							out.write("<table cellspacing=1 border=0 class=TBL>");

							int counter = 0;
					%>
				
			<tr>
				<td class=FHCELL>Nr</td>
				<td class=FHCELL>Data</td>
				<td class=FHCELL>Turul</td>
				<td class=FHCELL>Echipa 1</td>
				<td class=FHCELL>Echipa 2</td>
				<td class=FHCELL>Final</td>
				<td class=FHCELL colspan=2>Scorul tau</td>
				<td class=FHCELL>Puncte</td>
				<!-- td class=FHCELL>Value</td-->
			</tr>
			<%
				List<Match> vec = ApplicationFactory.getInstance().getModel().getMatchesForActiveTournament();
					for (Match m : vec) {
						counter++;
						Forecast f = m.getForecastByUser(user);

						if (f == null) {
							// create a dummy forecast if there is no forecast to make displaying easier
							f = new Forecast(user, m, -1, -1) {
								public int getBalls() {
									return 0;
								}
							};
						}
			%>

			<tr class="ROW<%=((counter % 2 == 1) ? "ODD" : "EVEN")%>">
				<td class="FCELL"><%=m.getNumber()%><input
					name="ch<%=m.getNumber()%>" id="ch<%=m.getNumber()%>" type="hidden"
					value="false" /></td>
				<td class="FCELL"><%=dateFormat.format(m.getDate())%></td>
				<td class="FCELL"><%=m.getStage()%></td>

				<%
					String tooltipT1 = "";
							if (m.getTeam1() != null) {
								tooltipT1 += m.getTeam1().getMatchesAsTable();
							}
				%>
				<td class="FCELL"
					onmouseover="tooltip.show('<%=tooltipT1%>',400); return;				
								ShowDiv(event,'<%=tooltipT1%>')">
					<%
						if (user.getWinningTeamForecast(tour) != null
										&& m.getTeam1().equals(user.getWinningTeamForecast(tour).getTeam())) {
									out.write(Utils.bold(m.getTeam1() != null ? m.getTeam1().getName() : m.getTeam1PlaceHolder()));
								} else {
									out.write((m.getTeam1() != null ? m.getTeam1().getName() : m.getTeam1PlaceHolder()));
								}
					%>
				</td>

				<%
					String tooltipT2 = "";
							if (m.getTeam2() != null) {
								tooltipT2 += m.getTeam2().getMatchesAsTable();
							}
				%>
				<td class="FCELL"
					onmouseover="tooltip.show('<%=tooltipT2%>',400); return;				
								ShowDiv(event,'<%=tooltipT2%>')">
					<%
						if (user.getWinningTeamForecast(tour) != null
										&& m.getTeam2().equals(user.getWinningTeamForecast(tour).getTeam())) {
									out.write(Utils.bold(m.getTeam2() != null ? m.getTeam2().getName() : m.getTeam2PlaceHolder()));
								} else {
									out.write((m.getTeam2() != null ? m.getTeam2().getName() : m.getTeam2PlaceHolder()));
								}
					%>
				</td>

				<td class="FCELL"><%=m.getScore1() != -1 ? "" + m.getScore1() + " - " + m.getScore2() : ""%>
				</td>

				<%
							String tooltipStats = m.getScoresAsTable();
							if (m.isStillOpenForBets()) {
								
				%>
				<td class="FCELL"
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')"><input
					class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fa<%=m.getId()%>" size="1"
					value="<%=(f.getScore1() != -1 ? f.getScore1() : "")%>"></input></td>
				<td class="FCELL"
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')"><input
					class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fb<%=m.getId()%>" size="1"
					value="<%=(f.getScore2() != -1 ? f.getScore2() : "")%>"></input></td>
				<%
					} else {
				%>
				<td colspan="2" class="FCELL"
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')"><%=f.getScore1() != -1 ? f.getScore1() + " - " + f.getScore2() : "--"%></td>
				<%
					}
				%>

				<td class="FCELL">
					<%
						for (int j = 0; j < f.getBalls(); j++) {
					%> <IMG width="10px" height="10px" src='img/ball.png' /> <%
 	}
 %>
				</td>
			</tr>

			<%
				}

					out.write("</table>");
					out.write("</form>");
				} // else
			%>
		</table>

	</center>
</body>
</html>