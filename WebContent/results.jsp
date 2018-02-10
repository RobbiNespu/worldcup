<%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="2014 competition" />
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
	<LINK type="text/css" rel="stylesheet" href="css/style.css"/>
	<jsp:include page="style.jsp"/>
	<title>Results</title>
</head>
<body>
<center>
<% 
  String user = (String)(session.getAttribute("user"));

  if (user==null)
  {
	  out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
	  %>
		  <jsp:include page="index.jsp"/>
	  <%

   }
   else
   {
	   
%>
<jsp:include page="menuHeader.jsp">
  <jsp:param name="menu" value="5"/>
</jsp:include>
<table>
	<tr valign=top >
		<td width=100% align=center >
			<table>
			<%
				for (char ch='A'; ch <= 'H'; ch++) {
					String groupName = Constants.GROUP+" " + ch;
					out.write("<tr><td colspan=2 ><B>" + groupName + "</b></td></tr>");
					
					out.write("<tr><td><table>");
					for (Match m : Database.getInstance().matches) {
						if (m.phase.equals(groupName)) {
							out.write("<tr>");
							out.write("<td>" + m.date.toString().substring(4, 16) + "</td>");
							out.write("<td style='padding-left:5px' >" + m.t1 + "</td>");
							out.write("<td style='padding-left:5px' >" + m.t2 + "</td>");
							out.write("<td style='padding-left:5px' >" + (m.g1!=-1?m.g1:"-") + "</td>");
							out.write("<td>-</td>");
							out.write("<td>" + (m.g2!=-1?m.g2:"-") + "</td>");						
							out.write("</tr>");
						}
					}
					out.write("</table></td>");
					out.write("<td><table>");
					ArrayList<GroupLine> group = Database.getInstance().groups.get(groupName);
					int counter=0;
					for (GroupLine gl : group) {
						out.write("<tr>");
						out.write("<td>" + ++counter+". " + "</td>");
						out.write("<td>" + gl.team + "</td>");
						out.write("<td style='padding-left:5px' >" + gl.getPlayed() + "</td>");
						out.write("<td style='padding-left:5px' >" + gl.w + "</td>");
						out.write("<td>" + gl.d + "</td>");
						out.write("<td>" + gl.l + "</td>");
						out.write("<td style='padding-left:5px' >" + gl.gf + "</td>");	
						out.write("<td>-</td>");
						out.write("<td>" + gl.ga + "</td>");						
						out.write("<td style='padding-left:5px' >" + gl.getPoints() + "</td>");						
						out.write("</tr>");
					}
					out.write("</table></td></tr>");
				}
			%>
			<tr><td><table>
	<%
	String lastRound = "";
	for (Match m : Database.getInstance().matches) {
		if (!m.phase.startsWith(Constants.GROUP)) {
			if (!lastRound.equals(m.phase)) {
				out.write("<tr><td colspan=2 ><B>" + m.phase + "</B></td></tr>");
				lastRound = m.phase;
			}
			out.write("<tr>");
			out.write("<td>" + m.date.toString().substring(4, 16) + "</td>");
			out.write("<td style='padding-left:5px' >" + m.t1 + "</td>");
			out.write("<td style='padding-left:5px' >" + m.t2 + "</td>");
			out.write("<td style='padding-left:5px' >" + (m.g1!=-1?m.g1:"-") + "</td>");
			out.write("<td>-</td>");
			out.write("<td>" + (m.g2!=-1?m.g2:"-") + "</td>");						
			out.write("</tr>");
		}
	}
	%>			
	</table></td></tr>
			
		</td>

	</tr>
	

</table>
	
</td>
</tr>

<%
   } // else
%>

</center>
</body>
</html>