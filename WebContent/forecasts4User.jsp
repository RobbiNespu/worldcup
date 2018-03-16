<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.core.utils.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/script.js"></script>
<title>Forecasts for user</title>

<style>
body, html {
    height: 100%;
    margin: 0;
}
</style>
</head>


<body>
<div class="bg">
	<img class="img-responsive" src="img/header.png" alt="Chania"
		width="1920" />
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SSI World Cup Competition</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="classification.jsp">Clasament</a></li>
				<li class="active"><a href="forecasts.jsp">Pronosticuri</a></li>
				<li><a href="champions.jsp">Echipa bonus</a></li>
				<li><a href="links.jsp">Reguli</a></li>
				<li><a href="declarations.jsp">Declaratii</a></li>
				<li><a href="settings.jsp">Setari</a></li>
				<li><a href="logout.jsp">Iesire</a></li>
			</ul>
		</div>
	</nav>
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
				String requestedUser = request.getParameter("user");
				User forUser = ApplicationFactory.getInstance().getModel().getUserByName(requestedUser);
		%>
	<div class="container">		
					<%

							int counter = 0;
					%>
	<div class="well">&nbsp;&nbsp;Acestea sunt pronosticurile lui <strong><%= requestedUser %></strong>. Pentru a te intoarce la clasament apasa <button type="button" class="btn btn-primary" onclick="location.href='classification.jsp'">Inapoi</button></div>

		<table class="table table-bordered table-striped table-hover table-condensed">
		<thead>
				
			<tr>
				<th >Nr</th>
				<th >Data</th>
				<th >Turul</th>
				<th >Echipa 1</th>
				<th >Echipa 2</th>
				<th >Final</th>
				<th colspan=2>Pronostic</th>
				<th >Puncte</th>
				<!-- td class=FHCELL>Value</td-->
			</tr>
			</thead>
			<tbody>
			<%
				List<Match> vec = ApplicationFactory.getInstance().getModel().getMatchesForActiveTournament();
					for (Match m : vec) {
						counter++;
						Forecast f = m.getForecastByUser(forUser);

						if (f == null) {
							// create a dummy forecast if there is no forecast to make displaying easier
							f = new Forecast(forUser, m, -1, -1) {
								public int getBalls() {
									return 0;
								}
							};
						}
			%>

			<tr>
				<td><%=m.getNumber()%><input
					name="ch<%=m.getNumber()%>" id="ch<%=m.getNumber()%>" type="hidden"
					value="false" /></td>
				<td><%=dateFormat.format(m.getDate())%></td>
				<td><%=m.getStage()%></td>

				<%
					String tooltipT1 = "";
							if (m.getTeam1() != null) {
								tooltipT1 += m.getTeam1().getMatchesAsTable();
							}
				%>
				<td
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
				<td
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

				<td><%=m.getScore1() != -1 ? "" + m.getScore1() + " - " + m.getScore2() : ""%>
				</td>

				<%
							String tooltipStats = m.getScoresAsTable();
							if (m.isStillOpenForBets()) {
								
				%>
				<td colspan="2" 
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')">? - ?</td>
				<%
					} else {
				%>
				<td colspan="2" 
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')"><%=f.getScore1() != -1 ? f.getScore1() + " - " + f.getScore2() : "--"%></td>
				<%
					}
				%>

				<td >
					<%
						for (int j = 0; j < f.getBalls(); j++) {
					%> <IMG width="10px" height="10px" src='img/ball.png' /> <%
 	}
 %>
				</td>
			</tr>

			<%
				}

					%>
					<%
				} // else
			%>
			</tbody>
		</table>
</div>
</div>
</body>
</html>
