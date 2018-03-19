<%@page import="com.ssn.core.ApplicationFactory"%>
<%@page import="com.ssn.core.utils.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>

<%
	PreviousWinner previousWinners[] = { new PreviousWinner("dco", 2002), new PreviousWinner("dco", 2004),
			new PreviousWinner("aci", 2006), new PreviousWinner("tmu", 2008), new PreviousWinner("aio", 2010),
			new PreviousWinner("gbo", 2012), new PreviousWinner("sorin", 2014),
			new PreviousWinner("sorin", 2016) };
%>

<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description" content="2014 competition" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" language="javascript" src="js/script.js"></script>

<title>Hall Of Fame</title>

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

<div class="bg">
	<img class="img-responsive" src="img/header.png" alt="Chania"
		width="1920" />
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SSI World Cup Competition</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="classification.jsp">Clasament</a></li>
				<li><a href="forecasts.jsp">Pronosticuri</a></li>
				<li><a href="champions.jsp">Echipa bonus</a></li>
				<li><a href="links.jsp">Reguli</a></li>
				<li><a href="declarations.jsp">Declaratii</a></li>
				<li><a href="settings.jsp">Setari</a></li>
				<li><a href="logout.jsp">Iesire</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">

		<div id="Tooltip"
			style='DISPLAY: none; background-color: #FFFFdd; font-family: tahoma; font-size: 2pt; text-align: left; WIDTH: 250px; HEIGHT: 200px; border: 1px solid black; overflow: auto;'
			runat='server'></div>

		<%
			User user = (User) (session.getAttribute("user"));

			if (user == null) {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		%>
		<jsp:include page="index.jsp" />
		<%
			} else {
		%>

		<table class="table table-bordered table-striped table-hover" onmouseout="tooltip.hide();return;hideDiv();">
		    <thead>
      <tr>
        <th>Pos</th>
        <th>User</th>
        <th title="Numarul de scoruri corecte ghicite">Scoruri</th>
        <th title="Numarul de meciuri la care a indicat corect echipa castigatoare">Castigatori</th>
        <th title="Reprezinta cate scoruri au fost pronosticate corect din numarul total de meciuri la care castigatoarea a fost pronosticata corect">Noroc</th>
        <th title="Numarul punctelor 'normale'">Puncte</th>
        <th title="Numarul punctelor bonus">Pct. bonus</th>
        <th title="Echipa favorita aleasa">Favorita</th>
        <th title="Numarul punctelor bonus pentru echipa favorita">Bonus favorita</th>
        <th title="Numarul total de puncte (puncte+puncte bonus)">Total</th>
      </tr>
    </thead>
						<tbody>
						<%
							int counter = 0;
								List<Classification> vec = ApplicationFactory.getInstance().getModel().getClassification();

								for (Classification c : vec) {
									counter++;
						%>
						<TR <%= (c.getName().equals(user.getUser()) ?  "class=\"success\"" : "") %>>
							<td><%=counter%></td>
							<td><B><A title="Vezi pronosticurile lui <%=c.getName()%>" href="forecasts4User.jsp?user=<%=c.getName()%>"> <%=c.getName()%></A> <%
 	String specialCrowns = "";
 			ArrayList<Integer> result = PreviousWinner.count(previousWinners, c.getName());
 			for (Integer year : result) {
 				specialCrowns += " <img src=\"img/smallStar.png\" title=\"Campion in " + year + "\"/> ";
 			}

 			if (counter == 1) {
 				specialCrowns += " <img src=\"img/cup.png\" title=\"Lider virtual\"/> ";
 			}
 %> <%=specialCrowns%>
							</B> <%
							User theUser = ApplicationFactory.getInstance().getModel().getUserByName(c.getName());
							if (theUser.getComment() != null && !theUser.getComment().isEmpty()) {
								%> <img src="img/comment-icon.png"
								title="<%=Utils.escapeHTML(theUser.getComment())%>" /> <%
							}
							%></td>
							<td>

								<%=c.getScores()%></td>

							<td>
								<%=c.getWinners()%>
							</td>


							<td><%=c.getScores() + c.getWinners() > 0
							? 100 * c.getScores() / (c.getWinners()) : 0%>%</td>

							<td>
								<%=c.getWinners() + c.getScores() * 2%>
							</td>

							<td>
								<%=c.getScoreBonus()%>
							</td>

							<td><%=c.getBonusTeam() != null ? c.getBonusTeam() : "--"%></td>
							<td><%=c.getTeamBonus().toString()%></td>
							<td><%=c.getTeamBonus().intValue() + c.getScoreBonus() + c.getWinners() + c.getScores() * 2%></td>

						</TR>

						<%
							}
							}
						%>
</tbody>
					</table>
		</table>
	</div>
	</div>
</body>
</html>