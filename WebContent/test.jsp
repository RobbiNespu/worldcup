
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="European Football Final Tournament 2008 competition" />
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
	<LINK type="text/css" rel="stylesheet" href="css/style.css"/>
	<title>Rules</title>
	<title>Full Page Background Image | Progressive</title>
	
	<jsp:include page="style.jsp"/>
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
  <jsp:param name="menu" value="3"/>
</jsp:include>
<table class=SIMPLE_TEXT_LEFT><tr valign=top ><td width=100%>
Regulile sunt urmatoarele:
<br/><br/>
Trebuie sa indicati scorul corect al partidelor la sfarsitul celor 90 de minunte regulamentare (inclusiv eventualele minute de prelungire indicate de arbitru). Nu se va lua in considerare scorul dupa eventualele reprize de prelungire sau lovituri de la 11m din faza eliminatorie a competitiei. 
<br/>
<ul>
<li>Se primeste 1 punct pentru indicarea corecta a echipei castigatoare dar nu si a scorului.</li>
<li>Se primesc 3 puncte pentru indicarea corecta a scorului.</li>
<li>Se primesc <B>puncte bonus</B> pentru indicarea corecta a scorului unui meci in care s-au inscris mai mult de 3 goluri. (1 punct pentru 4 goluri, 2 puncte pentru 5 goluri, 3 puncte pentru 6 goluri s.a.m.d.)</li>
<li>Se mai primesc puncte bonus pentru evolutia echipei favorite: Alegeti o echipa favorita si veti primi puncte bonus pentru rezultatele pozitive ale acestei echipe astfel:
<ul>
<li>cate 1 punct pentru fiecare victorie din grupe</li>
<li>1 punct pentru calificarea in optimi</li>
<li>1 punct pentru calificarea in sferturi</li>
<li>2 puncte pentru calificarea in semifinale</li>
<li>3 puncte pentru calificarea in finala</li>
<li>5 puncte pentru castigarea competitiei</li>
</ul>
</li>
</ul>
Scorul unui meci trebuie introdus cu cel putin 15 minute inainte de inceperea meciului respectiv. Echipa favorita poate fi aleasa inaintea inceperii primului meci al turneului.
In cazul egalitatii de puncte intre doi sau mai multi participanti <B>la sfarsitul competitiei</B> castigatorul va fi desemnat in functie de urmatoarele criterii:
<ul>
<li>cel mai mare numar de scoruri corecte
<li>cel mai mare numar de puncte bonus
<li>cel mai mare numar de puncte obtinut in meciul 64
<li>cel mai mare numar de puncte obtinut in meciul 63
<li>... si asa mai departe pana se ajunge la o diferenta
</ul>
<br/>
<br/>

</td>
	<td align="right" valign="top" width="150px">
	  <jsp:include page="comments.jsp"/>
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