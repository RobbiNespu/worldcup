
<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
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
<link rel="stylesheet" href="css/bootstrapOverrides.css"/>
  
<title>Bonus team</title>
<style>
body, html {
    height: 100%;
    margin: 0;
}
.bg {
    /* The image used */
    /*background-image: url("img/background1.jpg");*/

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
    
}
</style>
</head>
<body>
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
		<%
			User user = (User) (session.getAttribute("user"));

				if (user == null) {
					response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
		
			} else {
		%>		
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
				<li><a href="forecasts.jsp">Pronosticuri</a></li>
				<li class="active"><a href="#">Echipa bonus</a></li>
				<li><a href="links.jsp">Reguli</a></li>
				<li><a href="declarations.jsp">Declaratii</a></li>
				<li><a href="settings.jsp">Setari</a></li>
				<li><a href="logout.jsp">Iesire</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
				<%@ page import="java.sql.*"%>

					<%
					boolean before = !ApplicationFactory.getInstance().getModel().getActiveTournament().getMatches().get(0)
					.isStillOpenForBets();
						if (!before) {
					%> <div class="well">Selectati echipa bonus <%
 	} else {
 %> 
 <div class="well">Posibilitatea selectarii echipei
						bonus s-a incheiat. Urmatoarea sansa in 2020. Alegerea ta a fost:
 
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
						<button type="submit" class="btn btn-primary" onclick='classification.jsp'>Salveaza</button>
						
						<%
							}
						%>
					</FORM>

</div>
		<%
			} // else
		%>
</div>

</body>
<script>
$("#alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#alert").slideUp(500);
});
</script>

</html>