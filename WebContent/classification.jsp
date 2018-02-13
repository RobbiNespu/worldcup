<%@ page import = "com.ssn.worldcup.model.*" %>
<%@ page import = "java.util.*" %>

<%
PreviousWinner previousWinners[] = {  
	new PreviousWinner("dco", 2002),
	new PreviousWinner("dco", 2004),
	new PreviousWinner("aci", 2006),
	new PreviousWinner("tmu", 2008),
	new PreviousWinner("aio", 2010), 
	new PreviousWinner("gbo", 2012),
	new PreviousWinner("sorin", 2014)
};
if (true) return;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="2014 competition" />
    
  	<LINK type="text/css" rel="stylesheet" href="css/style.css"/>
  
  	<jsp:include page="style.jsp"/>
  
  	<script type="text/javascript" language="javascript" src="js/script.js"></script>
  	
	<title>Hall Of Fame</title>

</head>
<body>

	<div id="Tooltip" style='DISPLAY:none;background-color:#FFFFdd; font-family:tahoma; font-size:2pt; text-align: left; WIDTH:250px;HEIGHT:200px;border:1px solid black;overflow:auto;' runat='server'></div>

	<center>
	
	<% 
	  String user = (String)(session.getAttribute("user"));
	
	  if (user==null) {
		  out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		  %>
			  <jsp:include page="index.jsp"/>
		  <%
	   }
	   else {
	%>
	<jsp:include page="menuHeader.jsp">
  		<jsp:param name="menu" value="0"/>
	</jsp:include>

	<table width="100%" onmouseout="tooltip.hide();return;hideDiv();" ><tr valign=top><td width="100%"><table  border=1 cellspacing=1 class=TBL>

		<tr>
			<td class=FHCELL>Locul</td>
			<td class=FHCELL>User</td>
			<td class=FHCELL title="Numarul de scoruri corecte ghicite">Scoruri</td>
			<td class=FHCELL title="Numarul de meciuri la care a indicat corect echipa castigatoare">Castigatori</td>
			<td class=FHCELL title="Suma precedentelor doua coloane">S + C</td>
			<td class=FHCELL title="Reprezinta cate scoruri au fost pronosticate corect din numarul total de meciuri la care castigatoarea a fost pronosticata corect.">Noroc</td>
			<td class=FHCELL title="Numarul punctelor 'normale'">Puncte</td>
			<td class=FHCELL title="Numarul punctelor bonus">Pct. bonus</td>
			<td class=FHCELL title="Echipa favorita aleasa">Favorita</td>
			<td class=FHCELL title="Numarul total de puncte (puncte+puncte bonus)" >Total</td>
		</tr>
		<%
			int counter = 0;
				Vector<ClsLine> prev = Database.getInstance().getCls(true);

				Vector<ClsLine> vec = Database.getInstance().getCls(false);

				for (int i = 0; i < vec.size(); i++) {
					ClsLine c = vec.get(i);
					counter++;

					String gameuser = c.name;
					int points = c.scores * 2 + c.winners;
					int points2 = c.scores;
					int points3 = c.winners;
					String team = Database.getInstance().getBonusTeam(c.name);
					if (team == null)
						team = "-";
					int bonus = c.bonus;
					int total = points + bonus;
					boolean eliminated = Database.getInstance().isEliminated(
							Database.getInstance().getBonusTeam(c.name));

					String tooltip = Database.getInstance().getLastResults(c.name);

					StringBuffer res = new StringBuffer();
					StringBuffer resS = new StringBuffer();
					StringBuffer resW = new StringBuffer();
					int count = 0;
					int counter2 = 0;
					int counter2s = 0;
					int counter2w = 0;
					User u = Database.getInstance().getUsers().get(gameuser);
					//System.out.println("u.email =" + u.email);
					res.append("<TABLE id=detail cellspacing=1 border=0 class=TBL>");
					//res.append("<TR><TD colspan=3 class=FCELL >"+u.name+"[IP: "+u.email+"]</TD></TR>");
					res.append("<TR><TD colspan=4 class=FCELL><B>"
							+ u.name
							+ "</B> <SPAN class=FCELLW > Forma (ultimele 6 meciuri): last6 </SPAN></TD></TR>");
					int last6 = 0;
					int last6s = 0;
					int last6w = 0;

					resW.append(res);
					resS.append(res);
					for (int ii = 0; ii < Database.getInstance().matches.size(); ii++) {
						Match m = Database.getInstance().matches
								.get(Database.getInstance().matches.size() - ii - 1);
						if (m != null
								&& m.date.compareTo(new Date(System.currentTimeMillis())) < 0) {
							counter2++;
							Forecast f = Database.getInstance()
									.getForecast(c.name, "" + m.id);
							if (f != null) {
								int balls = Database.getInstance().getBalls(m.g1, m.g2, f.g1,
										f.g2);
								String color = "red";

								count++;

								if (balls > 3) {
									color = "#8000FF";
									if (count <= 6)
										last6s++;
								}
								if (balls == 3) {
									color = "green";
									if (count <= 6)
										last6s++;
								} else if (balls == 1) {
									color = "black";
									if (count <= 6)
										last6w++;
								} else if (m.g1 == -1) {
									color = "gray";
								}

								if (count <= 6)
									last6 += balls;

								if (count <= 12)
									res.append("<TR width=500px style=&quot;color:" + color
											+ "&quot; class=ROW"
											+ ((counter2 % 2 == 1) ? "ODD2" : "EVEN2")
											+ "><TD  class=FCELL width=20px >" + m.id
											+ ".</TD><TD  class=FCELL width=300px >" + m.t1 + " - "
											+ m.t2 + " " + (m.g1 != -1 ? m.g1 + "-" + m.g2 : "")
											+ "</td><td  width=30px class=FCELL>" + f.g1 + "-" + f.g2
											+ " </td><td  width=10px class=FCELL >  "
											+ (m.g1 == -1 ? "..." : balls + "p") + "</td></tr>");

								if (balls >= 3) {
									counter2s++;
									resS.append("<TR width=500px style=&quot;color:" + color
											+ "&quot; class=ROW"
											+ ((counter2s % 2 == 1) ? "ODD2" : "EVEN2")
											+ "><TD  class=FCELL width=20px >" + m.id
											+ ".</TD><TD  class=FCELL width=300px >" + m.t1 + " - "
											+ m.t2 + " " + (m.g1 != -1 ? m.g1 + "-" + m.g2 : "")
											+ "</td><td  width=30px class=FCELL>" + f.g1 + "-" + f.g2
											+ " </td><td  width=10px class=FCELL >  "
											+ (m.g1 == -1 ? "..." : balls + "p") + "</td></tr>");
								}
								if (balls == 1) {
									counter2w++;
									resW.append("<TR width=500px style=&quot;color:" + color
											+ "&quot; class=ROW"
											+ ((counter2w % 2 == 1) ? "ODD2" : "EVEN2")
											+ "><TD  class=FCELL width=20px >" + m.id
											+ ".</TD><TD  class=FCELL width=300px >" + m.t1 + " - "
											+ m.t2 + " " + (m.g1 != -1 ? m.g1 + "-" + m.g2 : "")
											+ "</td><td  width=30px class=FCELL>" + f.g1 + "-" + f.g2
											+ " </td><td  width=10px class=FCELL >  "
											+ (m.g1 == -1 ? "..." : balls + "p") + "</td></tr>");
								}
							} else {
								count++;
								if (count <= 12) {
									res.append("<TR style=&quot;color:#777777&quot; class=ROW"
											+ ((counter2 % 2 == 1) ? "ODD2" : "EVEN2")
											+ "><TD  class=FCELL width=20px >" + m.id
											+ ".</TD><TD  class=FCELL width=300px >" + m.t1 + " - "
											+ m.t2 + "</td><td  width=20px class=FCELL>");
									res.append(" - " + "</td><td  class=FCELL> 0p</td></tr>");
								}
							}
						}
					}

					res.append("</TABLE>");
					resW.append("</TABLE>");
					resS.append("</TABLE>");
					String tooltipHTML = res.toString();
					tooltipHTML = tooltipHTML.replaceFirst("last6", "<B>" + last6
							+ "p</B> (" + last6s + " - " + last6w + " - "
							+ (6 - last6s - last6w) + ")");

					if (user.equals(gameuser))
						out.write("<tr titlex=\"" + tooltip
								+ "\" class=ROWUSER onmouseover=\"tooltip.show('" + tooltipHTML
								+ "', 300);return;ShowDiv(top.event,'" + tooltipHTML
								+ "')\"  >");
					else {
						out.write("<tr titlex=\"" + tooltip + "\" class=ROW"
								+ ((counter % 2 == 1) ? "ODD" : "EVEN")
								+ " onmouseover=\"tooltip.show('" + tooltipHTML
								+ "', 300);return;ShowDiv(event,'" + tooltipHTML + "')\" >");
					}
          
          /*
					if (i > 0) {
						ClsLine c2 = vec.get(i - 1);
						if (c2.scores * 2 + c2.winners + c2.bonus != total
								|| (c2.scores * 2 + c2.winners + c2.bonus == total && c2.scores != c.scores)
								|| (c2.scores * 2 + c2.winners + c2.bonus == total
										&& c2.scores == c.scores && c2.bonus != c.bonus)) {
							int oldPosition = Database.getInstance().getPositionForUser(prev, gameuser)+1;
              int currentPosition = Database.getInstance().getPositionForUser(vec, gameuser)+1;
              out.write("<td class=FCELL>" + currentPosition);
							if (oldPosition < currentPosition) {
								out.write("<img src='delta_min.gif' title='"+(oldPosition)+"'/>");
							} else if (oldPosition > currentPosition) {
								out.write("<img src='delta_plus.gif' title='"+(oldPosition)+"'/>");
							} 
							out.write( "</td>");
						} else {
							out.write("<td class=FCELL>" + "=" + "</td>");
						}
					} else {
            */
            
						int oldPosition = Database.getInstance().getPositionForUser(prev, gameuser)+1;
            int currentPosition = Database.getInstance().getPositionForUser(vec, gameuser)+1;
						out.write("<td class=FCELL>" + currentPosition);
            
						if (oldPosition < currentPosition) {
							out.write("<img src='delta_min.gif' title='"+(oldPosition)+"'/>");
						} else if (oldPosition > currentPosition) {
							out.write("<img src='delta_plus.gif' title='"+(oldPosition)+"'/>");
						} 
            
						out.write( "</td>");
            
//					}

					String specialCrowns = "";
					ArrayList<Integer> result = PreviousWinner.count(previousWinners, u.name);
					for (Integer year:result){
						specialCrowns += " <img src='smallStar.png' title='"+year+"'/> ";
					}					

					if (counter == 1) {
						specialCrowns += " <img src='cup.png'/> ";
					}

					out.write("<td class=FCELL onmouseover=\"event.cancelBubble = true;\"><B>"
							+ (gameuser.length() > 9 ? gameuser.substring(0, 9) : gameuser) 
							+ " " + (u.comment != null && u.comment.length()>0?"<IMG src='img/comment-icon.png' title='"+u.comment.replaceAll(">", "&gt;").replaceAll("<", "&lt;")+"'/>":"") + specialCrowns + "</B></td>");
					out.write("<td class=FCELL onmouseover=\"tooltip.show('"
							+ resS.toString().replaceFirst(
									"last6",
									"<B>" + last6 + "p</B> (" + last6s + " - " + last6w + " - "
											+ (6 - last6s - last6w) + ")")
							+ "', 300);event.cancelBubble = true;\">" + points2 + "</td>");
					out.write("<td class=FCELL onmouseover=\"tooltip.show('"
							+ resW.toString().replaceFirst(
									"last6",
									"<B>" + last6 + "p</B> (" + last6s + " - " + last6w + " - "
											+ (6 - last6s - last6w) + ")")
							+ "', 300);event.cancelBubble = true;\">" + (points3 - points2)
							+ "</td>");
					out.write("<td class=FCELL><I>" + (points3) + "</I></td>");
					out.write("<td class=FCELL><I>"
							+ (points3 != 0 ? ""
									+ ((int) ((int) ((float) (10000 * (points2) / (points3))) / 100) + "%")
									: "-") + "</I></td>");
					String s = "<SPAN class=FCELL>"+c.bonusString+"</SPAN>";
					out.write("<td class=FCELL><B>" + points + "</B></td>");
					if (team.equals("-")) {
						out.write("<td class=FCELL onmouseover=\"tooltip.show('" + s
								+ "', 300);event.cancelBubble = true;\">"
								+ bonus
								+ "</td><td class=FCELL onmouseover=\"tooltip.show('"
								+ s
								+ "', 300);event.cancelBubble = true;\"><SPAN style='color:#888888;'> "
								+ "<strike>" + team + "</strike>" + " </SPAN></td>");
					} else if (!eliminated) {
						out.write("<td class=FCELL onmouseover=\"tooltip.show('" + s
								+ "', 300);event.cancelBubble = true;\">" + bonus + "</td>"
								+ "<td class=FCELL onmouseover=\"tooltip.show('" + s
								+ "', 300);event.cancelBubble = true;\"> " + team + "</td>");
					} else {
						out.write("<td class=FCELL onmouseover=\"tooltip.show('" + s
								+ "', 300);event.cancelBubble = true;\">"
								+ bonus
								+ "</td><td class=FCELL onmouseover=\"tooltip.show('"
								+ s
								+ "', 300);event.cancelBubble = true;\"><SPAN style='color:#888888;'> "
								+ "<strike>" + team + "</strike>" + " </SPAN></td>");
					}
					out.write("<td class=FCELL><B>" + total + "</B></td>");
					out.write("</tr>");
				}

				out.write("</table>");
		%>
		<BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/>
								</td>
							</tr>
						</table>
				
					</td>
				</tr>
			</table>
		<%
		   } //else
		%>
		</center>
	</body>
</html>