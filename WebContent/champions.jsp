
<%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="European Football Final Tournament 2010 competition" />
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
	<LINK type="text/css" rel="stylesheet" href="css/style.css"/>
	<jsp:include page="style.jsp"/>
	<title>Bonus team</title>
</head>
<body>
<center>
<% 
  String user = (String)(session.getAttribute("user"));

  Calendar cal = new GregorianCalendar();
  cal.set(2014, 5, 12, 23, 00, 00);
  boolean before = cal.getTimeInMillis()<System.currentTimeMillis();


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
  <jsp:param name="menu" value="2"/>
</jsp:include>
<table width="100%" height="600px"><tr valign=top><td width=100% >
<%@ page import = "java.sql.*" %>

  <%if (!before){ %>
	<SPAN class=SIMPLE_TEXT>Selectati echipa bonus</SPAN>
  <%} else {%>
  <SPAN class=SIMPLE_TEXT>Posibilitatea selectarii echipei bonus s-a incheiat. Urmatoarea sansa in 2016. Alegerea ta a fost:</SPAN>
  <%}%>
  
	<FORM action="setChampions.jsp" method=POST>
	<%
	  out.write("<select name=\"teamid\" "+(!before?"":"disabled='true'")+">");

			Vector<Team> vec = 	Database.getInstance().getTeams();
/*      for (int i=0; i<vec.size(); i++){
        Team t = vec.get(i);
        for (int j=i+1; j<vec.size(); j++){
          if (t.name.equals(vec.get(j).name)){
            vec.remove(j);
          }
        }
      }
   */   
			String teamid = Database.getInstance().getBonusTeam(user);
      out.write("<option value=\"\" "+(teamid==null||teamid.length()==0?"selected":"")+">--");
			for (int i=0; i<vec.size(); i++)
			{
		    out.write("<option value=\""+vec.get(i).name+"\" "+((vec.get(i).name.equals(teamid))?"selected":"")+">"+vec.get(i).name);
			}
		out.write("</select>");
	%>

  <%if (!before){ %>
	<INPUT type="submit" value="Salveaza">
  <%} %>
	</FORM>
	
	
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