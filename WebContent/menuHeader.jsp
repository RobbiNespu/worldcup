<% int selMenu = Integer.parseInt(request.getParameter("menu")); %>
<table border=0 class="SIMPLE_TEXT_CENTERED"  width="800px" >
<tr height=100 >
<td colspan=8>
<A href="http://www.fifa.com/worldcup/" target="about:blank"><img width="600px" src="header.PNG"/></a>
</td>
</tr>
<tr>
<td width="100px" class=<%=selMenu==0?"SEL_MENU":"MENU"%>>
  <a href="classification.jsp">Clasament</a>
</td>
<td width="100px" class=<%=selMenu==1?"SEL_MENU":"MENU"%>>
  <a href="forecasts.jsp">Pronosticuri</a>
</td>
<td width="100px" class=<%=selMenu==2?"SEL_MENU":"MENU"%>>
  <a href="champions.jsp">Echipa bonus</a>
</td>
<td width="100px" class=<%=selMenu==3?"SEL_MENU":"MENU"%>>
  <a href="links.jsp">Reguli</a>
</td>
<td width="100px" class=<%=selMenu==4?"SEL_MENU":"MENU"%>>
  <a href="settings.jsp">Setari</a>
</td>
<td width="100px" class=<%=selMenu==6?"SEL_MENU":"MENU"%>>
  <a href="logout.jsp">Iesire</a>
</td>
</tr>
<tr valign=top >
<td colspan=8 align=left >
	<jsp:include page="comments.jsp"/>