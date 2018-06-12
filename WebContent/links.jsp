<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <meta name="description" content="European Football Final Tournament 2008 competition" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/script.js"></script>
<link rel="stylesheet" href="css/bootstrapOverrides.css"/>

	<title>Rules</title>
</head>
<body>
<% 
  User user = (User)(session.getAttribute("user"));

if (user == null) {
	response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");


   }
   else
   {
%>

<div class="bg">
	<img class="img-responsive" src="img/header.png" alt="Chania"
		width="1920" />
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SSI World Cup Competition</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="classification.jsp">Clasament</a></li>
				<li><a href="forecasts.jsp">Pronosticuri</a></li>
				<li><a href="champions.jsp">Echipa bonus</a></li>
				<li class="active"><a href="links.jsp">Reguli</a></li>
				<li><a href="declarations.jsp">Declaratii</a></li>
				<li><a href="settings.jsp">Setari</a></li>
				<li><a href="logout.jsp">Iesire</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
	<div class="well">
	<p>
Regulile sunt urmatoarele:
</p>
<p>
Trebuie sa indicati scorul corect al partidelor la sfarsitul celor 90 de minunte regulamentare (inclusiv eventualele minute de prelungire indicate de arbitru). Nu se va lua in considerare scorul dupa eventualele reprize de prelungiri sau lovituri de la 11m din faza eliminatorie a competitiei. 
</p>
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
  <li>1 punct pentru victoria in meciul pentru locul 3</li>
  <li>5 puncte pentru castigarea competitiei</li>
  </ul>
</ul>
<p>
Echipa favorita se poate seta doar inainte de primul meci al turneului!
</p>
<p>
Scorul unui meci trebuie introdus cu cel putin 15 minute inainte de inceperea meciului respectiv. Echipa favorita poate fi aleasa inaintea inceperii primului meci al turneului.
</p>
<p>
In cazul egalitatii de puncte intre doi sau mai multi participanti <B>la sfarsitul competitiei</B> castigatorul va fi desemnat in functie de urmatoarele criterii:
<ul>
<li>cel mai mare numar de scoruri corecte
<li>cel mai mare numar de puncte bonus
<li>cel mai mare numar de puncte obtinut in meciul 64
<li>cel mai mare numar de puncte obtinut in meciul 63
<li>... si asa mai departe pana se ajunge la o diferenta
</ul>
</p>
<p>
Este permisa si participarea unor persoane care nu sunt angajati Schaefer (ex: rudele angajatilor), dar <U>cupa
o va primi angajatul Schaefer cel mai bine plasat in clasament</U>.
</p>
</div>
</div>

</div>
<%
   } //else
%>
</body>
</html>