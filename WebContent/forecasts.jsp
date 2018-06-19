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
<link rel="stylesheet" href="css/bootstrapOverrides.css"/>

<title>Forecasts</title>

<script>
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

.tooltip {
  background-color: #fff8c9;
  opacity:1!important; 
  box-shadow: 5px 5px 10px grey; 
  border: 1px solid #ddd6a7
}
.tooltip-inner {
  background-color: #fff8c9;
  opacity:1!important;
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
			if (user == null) {
				response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deloginat automat. Pentru a continua, relogineaza-te.");
				return;
			}
			user = ApplicationFactory.getInstance().getModel().getUserByName(user.getUser());			
			Tournament tour = ApplicationFactory.getInstance().getModel().getActiveTournament();

			DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.ENGLISH);

			if (user == null) {
				response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");

			} else {
		%>
	<div class="container">		
	<form action=setScore.jsp method=POST>
	
	<div class="well">&nbsp;&nbsp;Nu uitati sa apasati butonul <button type="submit" class="btn btn-primary" onclick='dataChanged = false;'>Salveaza</button>  dupa ce ati editat scorurile, pentru a le salva in baza de date!!!</div>
					<%

							int counter = 0;
					%>
		<table class="table table-bordered table-striped table-hover table-condensed">
		<thead>
				
			<tr>
				<th>Nr</th>
				<th >Data</th>
				<th >Turul</th>
				<th >Echipa 1</th>
				<th >Echipa 2</th>
				<th >Final</th>
				<th >Scorul tau</th>
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
            int balls = f.getBalls();
			%>

			<tr
      <%= balls == 3 ? "class=\"success\"":(balls==1?"class=\"info\"":(balls>3?"class=\"danger\"":"")) %>
      >
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
					data-toggle="tooltip" data-html="true" data-container="body" 
					
					>
					<%
						//System.out.println(m.getNumber());
						if (user.getWinningTeamForecast(tour) != null
										&& m.getTeam1() != null && m.getTeam1().equals(user.getWinningTeamForecast(tour).getTeam())) {
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
				<td data-toggle="tooltip" data-html="true" data-container="body">
					<%
						if (user.getWinningTeamForecast(tour) != null
										&& m.getTeam2() != null && m.getTeam2().equals(user.getWinningTeamForecast(tour).getTeam())) {
									out.write(Utils.bold(m.getTeam2() != null ? m.getTeam2().getName() : m.getTeam2PlaceHolder()));
								} else {
									out.write((m.getTeam2() != null ? m.getTeam2().getName() : m.getTeam2PlaceHolder()));
								}
					%>
				</td>

				<td><%= m.getScore1() != -1 ? "" + m.getScore1() + " - " + m.getScore2() : "" %>
				</td>

				<%
							String tooltipStats = m.getScoresAsTable();
								
				%>
				<td  data-toggle="tooltip" data-html="true" data-container="body" 
        
        <% 
        if (tooltipStats != null) { 
        out.write("title=\"" + tooltipStats +"\"");
        }
        
        %>
        >
        <%        
							if (m.isStillOpenForBets()) {
                %>
					<input
					class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fa<%=m.getId()%>" size="1"
					value="<%=(f.getScore1() != -1 ? f.getScore1() : "")%>"></input>
				
					<input
					class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fb<%=m.getId()%>" size="1"
					value="<%=(f.getScore2() != -1 ? f.getScore2() : "")%>"></input></td>
				<%
					} else {
				%>
				<%=f.getScore1() != -1 ? f.getScore1() + " - " + f.getScore2() : "--"%></td>
				<%
					}
				%>

				<td >
					<%
						for (int j = 0; j < f.getBalls(); j++) {
					%> <IMG width="20px" height="20px" src='img/ball.png' /> <%
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
<script>
$("#alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#alert").slideUp(500);
});

$(function () {
	  $('[data-toggle="tooltip"]').tooltip({
	        template: '<div class="tooltip" role="tooltip"><div class="arrow"></div><div class="tooltip-inner" style="max-width:100%; color: black"></div></div>'
	    })
});
</script>
</html>