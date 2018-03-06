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
    background-image: url("img/background1.jpg");

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
				<li class="active"><a href="#">Clasament</a></li>
				<li><a href="#">Pronosticuri</a></li>
				<li><a href="#">Echipa bonus</a></li>
				<li><a href="#">Reguli</a></li>
				<li><a href="#">Setari</a></li>
				<li><a href="#">Iesire</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li><a href="#" id="myBtn"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</nav>

<div class="container">
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders to a table:</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
	<div>

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

		<table class="table-stripped table-bordered" onmouseout="tooltip.hide();return;hideDiv();">
		<thead>
			<tr>
				<td width="100%"><table border=1 cellspacing=1 class=TBL>

						<tr>
							<td></td>
							<td>User</td>
							<td class="FHCELL" title="Numarul de scoruri corecte ghicite">Scoruri</td>
							<td class=FHCELL
								title="Numarul de meciuri la care a indicat corect echipa castigatoare">Castigatori</td>
							<td class=FHCELL title="Suma precedentelor doua coloane">S +
								C</td>
							<td class=FHCELL
								title="Reprezinta cate scoruri au fost pronosticate corect din numarul total de meciuri la care castigatoarea a fost pronosticata corect.">Noroc</td>
							<td class=FHCELL title="Numarul punctelor 'normale'">Puncte</td>
							<td class=FHCELL title="Numarul punctelor bonus">Pct. bonus</td>
							<td class=FHCELL title="Echipa favorita aleasa">Favorita</td>
							<td class=FHCELL
								title="Numarul punctelor bonus pentru echipa favorita">Bonus
								favorita</td>
							<td class=FHCELL
								title="Numarul total de puncte (puncte+puncte bonus)">Total</td>
						</tr>
						</thead>
						<tbody>
						<%
							int counter = 0;
								List<Classification> vec = ApplicationFactory.getInstance().getModel().getClassification();

								for (Classification c : vec) {
									counter++;
						%>
						<TR
							class="ROW<%=(c.getName().equals(user.getUser()) ? "USER" : ((counter % 2 == 1) ? "ODD" : "EVEN"))%>">
							<td class="FCELL"><%=counter%></td>
							<td class="FCELL"><B> <%=c.getName()%> <%
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
							<%
								String cshtml = theUser.getCorrectScoresAsHTML(); 
								String cswhtml = theUser.getCorrectWinnersAndScoresAsHTML();  
								String cwhtml = theUser.getCorrectWinnersAsHTML(); 
								String allhtml = theUser.getAllScoresAsHTML(); 
								String bwhtml = theUser.getBonusWinnersAsHTML(); 
							%>

							<td class="FCELL"
								onmouseover="tooltip.show('<%=cshtml%>', 300); return; ShowDiv(event,'<%=cshtml%>')">

								<%=c.getScores()%></td>

							<td class="FCELL"
								onmouseover="tooltip.show('<%=cwhtml%>', 300); return; ShowDiv(event,'<%=cwhtml%>')">
								<%=c.getWinners()%>
							</td>

							<td class="FCELL"
								onmouseover="tooltip.show('<%=cswhtml%>', 300); return; ShowDiv(event,'<%=cswhtml%>')">
								<%=c.getScores() + c.getWinners()%>
							</td>

							<td class="FCELL"><%=c.getScores() + c.getWinners() > 0
							? 100 * c.getScores() / (c.getScores() + c.getWinners()) : 0%>%</td>

							<td class="FCELL"
								onmouseover="tooltip.show('<%=allhtml%>', 300); return; ShowDiv(event,'<%=allhtml%>')">
								<%=c.getWinners() + c.getScores() * 2%>
							</td>

							<td class="FCELL"
								onmouseover="tooltip.show('<%=bwhtml%>', 300); return; ShowDiv(event,'<%=bwhtml%>')">
								<%=c.getScoreBonus()%>
							</td>

							<td class="FCELL"><%=c.getBonusTeam() != null ? c.getBonusTeam() : "--"%></td>
							<td class="FCELL"><%=c.getTeamBonus().toString()%></td>
							<td class="FCELL"><%=c.getTeamBonus().intValue() + c.getScoreBonus() + c.getWinners() + c.getScores() * 2%></td>

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