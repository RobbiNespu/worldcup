<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>

<%
	PreviousWinner previousWinners[] = { new PreviousWinner("dco", 2002), new PreviousWinner("dco", 2004),
			new PreviousWinner("aci", 2006), new PreviousWinner("tmu", 2008), new PreviousWinner("aio", 2010),
			new PreviousWinner("gbo", 2012), new PreviousWinner("sorin", 2014) };
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description" content="2014 competition" />

<LINK type="text/css" rel="stylesheet" href="css/style.css" />

<jsp:include page="style.jsp" />

<script type="text/javascript" language="javascript" src="js/script.js"></script>

<title>Hall Of Fame</title>

</head>
<body>

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
	<jsp:include page="menuHeader.jsp">
		<jsp:param name="menu" value="0" />
	</jsp:include>

	<table width="100%" onmouseout="tooltip.hide();return;hideDiv();">
		<tr valign=top>
			<td width="100%"><table border=1 cellspacing=1 class=TBL>

					<tr>
						<td class=FHCELL>Locul</td>
						<td class=FHCELL>User</td>
						<td class=FHCELL title="Numarul de scoruri corecte ghicite">Scoruri</td>
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
					<%
							int counter = 0;
								List<Classification> vec = ApplicationFactory.getInstance().getModel().getClassification();

								for (Classification c : vec) {
									counter++;
						%>
					<TR>
						<td><%=counter%></td>
						<td><%=c.getName()%></td>
						<td><%=c.getScores()%></td>
						<td><%=c.getWinners()%></td>
						<td><%=c.getScores()+c.getWinners()%></td>
						<td><%=c.getScores()+c.getWinners() > 0 ? 100*c.getScores()/(c.getScores()+c.getWinners()) : 0%>%</td>
						<td><%=c.getWinners()+c.getScores()*2%></td>
						<td><%=c.getScoreBonus()%></td>
						<td><%=c.getBonusTeam()%></td>
						<td><%=c.getTeamBonus().toString()%></td>
						<td><%=c.getTeamBonus().intValue()+c.getScoreBonus()+c.getWinners()+c.getScores()*2%></td>

					</TR>

					<%
							}
							}
						%>

				</table>
	</table>
</body>
</html>