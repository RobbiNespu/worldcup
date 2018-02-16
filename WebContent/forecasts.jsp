<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description"
	content="European Football Final Tournament 2008 competition" />
<LINK type="text/css" rel="stylesheet" href="wm.css" />
<LINK type="text/css" rel="stylesheet" href="css/style.css" />
<jsp:include page="style.jsp" />
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
		<table width=100%>
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
								public int getBalls(){
									return 0;
								}
							};
						}
			%>

			<tr class="ROW<%=((counter % 2 == 1) ? "ODD" : "EVEN")%>"
				title="test">
				<td><%=m.getNumber()%><input name="ch<%=m.getNumber() %>" id="ch<%=m.getNumber() %>" type="hidden" value="false" /></td>
				<td><%=dateFormat.format(m.getDate())%></td>
				<td><%=m.getStage()%></td>

				<td><%=m.getTeam1() != null ? m.getTeam1().getName() : m.getTeam1PlaceHolder()%>
				</td>

				<td><%=m.getTeam2() != null ? m.getTeam2().getName() : m.getTeam2PlaceHolder()%>
				</td>

				<td><%=m.getScore1() != -1 ? "" + m.getScore1() + " - " + m.getScore2() : ""%>
				</td>

				<%
					Calendar cal = new GregorianCalendar();
							Date matchDate = m.getDate();
							cal.setTime(matchDate);
							boolean after = cal.getTimeInMillis() - (900 * 1000) < System.currentTimeMillis();
							if (!after) {
				%>
				<td class="FCELL"><input class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fa<%=m.getId()%>" size="1"
					value="<%=(f.getScore1() != -1 ? f.getScore1() : "")%>"></input></td>
				<td class="FCELL"><input class="ROWINP"
					onchange='dataChanged=true; this.style.background="red"; ch<%=m.getId()%>.value=true;'
					type="text" name="fb<%=m.getId()%>" size="1"
					value="<%=(f.getScore2() != -1 ? f.getScore2() : "")%>"></input></td>
				<%
					} else {
				%>
				<td colspan="2"><%= f.getScore1() != -1 ? f.getScore1() + " - " + f.getScore2() : "--"%></td>
				<%
					}
				%>

				<td>
				<% 
						for (int j = 0; j < f.getBalls(); j++) {
							%>
							<IMG width="12" height="12" src='img/ball.png'/>
							<%
						}
				%>
				</td>
			</tr>

			<%
				/*
												String matchID = "" + m.getId();
												//String stage = m.phase;
												String t1 = m.getTeam1().getName();
												String t2 = m.getTeam2().getName();
												String g1 = (m.getScore1() != -1 ? "" + m.getScore1() : null);
												String g2 = (m.getScore2() != -1 ? "" + m.getScore2() : null);
												String fg1 = (f.getScore1() != -1 ? "" + f.getScore1() : null);
												String fg2 = (f.getScore2() != -1 ? "" + f.getScore2() : null);
												
												int balls = f.getBalls(); 
												
												Calendar cal = new GregorianCalendar();
												Date matchDate = m.getDate(); 
												cal.setTime(matchDate);
												boolean before = cal.getTimeInMillis() - (900 * 1000) < System.currentTimeMillis();
												*/
						// 
						/*
						String title = "";
						Database db = Database.getInstance();
						Hashtable<String, Integer> ht = new Hashtable<String, Integer>();
						Enumeration enUsers = db.getUsers().keys();
						int total = 0;
						int total1 = 0;
						int totalx = 0;
						int total2 = 0;
						
						while (enUsers.hasMoreElements()) {
							User u = db.getUsers().get(enUsers.nextElement());
							Forecast fore = db.getForecast(u.name, "" + m.id);
							if (fore != null) {
								total++;
								String key = fore.g1 + "-" + fore.g2;
						
								if (fore.g1 > fore.g2) {
									total1++;
								} else if (fore.g1 < fore.g2) {
									total2++;
								} else
									totalx++;
						
								if (ht.containsKey(key)) {
									int count = ht.get(key).intValue();
									count++;
									ht.put(key, new Integer(count));
								} else {
									ht.put(key, new Integer(1));
								}
							}
						}
						
						DecimalFormat df = new DecimalFormat("#.##");
						Enumeration en = ht.keys();
						while (en.hasMoreElements()) {
							String s = (String) (en.nextElement());
							int n = ht.get(s).intValue();
							if (s.equals(m.g1 + "-" + m.g2)) {
								title += (n + " x (" + s + ") = " + (df.format(n * 100.0 / total)) + "% !!!\n");
							} else {
								title += (n + " x (" + s + ") = " + (df.format(n * 100.0 / total)) + "%\n");
							}
						}
						
						int totalsum = total1 + totalx + total2;
						if (totalsum != 0) {
							title += "----------------------\n";
							double p1 = 100.0 * total1 / totalsum;
							double px = 100.0 * totalx / totalsum;
							double p2 = 100.0 * total2 / totalsum;
							title += m.t1 + " " + df.format(100.0 * total1 / totalsum) + "%" + "\n";
							title += "Egal" + " " + df.format(100.0 * totalx / totalsum) + "%" + "\n";
							title += m.t2 + " " + df.format(100.0 * total2 / totalsum) + "%" + "\n";
							//title+=(""+df.format(100.0/p1)+"-"+df.format(100.0/px)+"-"+df.format(100.0/p2));
						}
						
						String bonus = Database.getInstance().getBonusTeam(user);
						out.write("<tr class=ROW" + ((counter % 2 == 1) ? "ODD" : "EVEN") + " title='" + title + "'>");
						out.write("<td class=FCELL>" + matchID + "<input name=ch" + matchID + " id=ch" + matchID
								+ " type=hidden value=false /></td>");
						out.write("<td class=FCELL>" + matchDate.toString().substring(0, 16) + "</td>");
						out.write("<td class=FCELL><A href='results.jsp'>" + stage + "</A></td>");
						out.write("<td class=FCELL>" + (t1.equals(bonus) ? "<b>" + t1 + "</b>" : t1) + "</td>");
						out.write("<td class=FCELL>" + (t2.equals(bonus) ? "<b>" + t2 + "</b>" : t2) + "</td>");
						out.write("<td class=FCELL>" + (g1 != null ? g1 : "-") + " : ");
						out.write("" + (g2 != null ? g2 : "-") + "</td>");
						if (before) {
							out.write("<td class=FCELL colspan=2><center>" + (fg1 != null ? fg1 : "-") + " : "
									+ (fg2 != null ? fg2 : "-") + "</center></td>");
						} else {
							out.write(
									"<td class=FCELL><input class=ROWINP onchange='dataChanged=true;this.style.background=\"red\"; ch"
											+ matchID + ".value=true;' " + " type=text name=fa" + matchID + " size=1 value="
											+ (fg1 != null ? fg1 : "") + "></input></td>");
							out.write(
									"<td class=FCELL><input class=ROWINP onchange='dataChanged=true;this.style.background=\"red\"; ch"
											+ matchID + ".value=true;' " + " type=text name=fb" + matchID + " size=1 value="
											+ (fg2 != null ? fg2 : "") + "></input></td>");
						}
						out.write("<td>");
						for (int j = 0; j < balls; j++) {
							out.write("<IMG width=12 height=12 src='ball.png' />");
						}
						out.write("</td>");
						
						/* // match value
							out.write("<td>");
							for (int j=0; j<m.getMatchValue(); j++)  
							{
								out.write("<IMG width=12 height=12 src='smallStar.png' />");
							}
							out.write("</td>");
						
						out.write("</tr>");
						*/
			%>

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