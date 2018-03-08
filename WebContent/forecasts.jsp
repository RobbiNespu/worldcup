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
<style>
body, html {
    height: 100%;
    margin: 0;
}
</style>
</head>


<body>
<div class="bg">

<% 
String alert = request.getParameter("alert");
String type =  request.getParameter("alertType");

if (request.getParameter("alert") != null) {
%>
  <div id="alert" class="alert <%=type.equals("S")?"alert-success":"alert-danger" %> alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><%= alert %></strong>
  </div>
<%
}
%>
  
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
				<li><a href="#">Echipa bonus</a></li>
				<li><a href="#">Reguli</a></li>
				<li><a href="#">Setari</a></li>
				<li><a href="#">Iesire</a></li>
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
		%>
	<div class="container">		
	<form action=setScore.jsp method=POST>
	<input type=submit value='Salveaza' onclick='dataChanged = false;'/><SPAN class=SIMPLE_COMMENT>&nbsp;Nu uitati sa apasati butonul <B>Salveaza</B>  dupa ce ati editat scorurile, pentru a le salva in baza de date!!!</SPAN>
			<tr>
				<td>
					<%

							int counter = 0;
					%>
		<table class="table table-bordered table-striped table-hover table-condensed">
		<thead>
				
			<tr>
				<th >Nr</th>
				<th >Data</th>
				<th >Turul</th>
				<th >Echipa 1</th>
				<th >Echipa 2</th>
				<th >Final</th>
				<th colspan=2>Scorul tau</th>
				<th >Puncte</th>
				<!-- td class=FHCELL>Value</td-->
			</tr>
			</thead>
			<tbody>
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
				<td
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')"><input
					class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fa<%=m.getId()%>" size="1"
					value="<%=(f.getScore1() != -1 ? f.getScore1() : "")%>"></input></td>
				<td
					onmouseover="tooltip.show('<%=tooltipStats%>',400); return;				
								ShowDiv(event,'<%=tooltipStats%>')"><input
					class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fb<%=m.getId()%>" size="1"
					value="<%=(f.getScore2() != -1 ? f.getScore2() : "")%>"></input></td>
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
					</form>
</div>
</div>
</body>
</html>
<script>
$("#alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#alert").slideUp(500);
});
</script>