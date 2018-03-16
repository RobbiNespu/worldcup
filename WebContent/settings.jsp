<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<style>
.labelStyle{

border-style: none none groove;
border-color:red;

}

</style>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><title>Settings</title>
</head>
<body onunload="confirmUnsavedChanges()">

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
		<%
			User user = (User) (session.getAttribute("user"));

			if (user == null) {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		%>
		<jsp:include page="index.jsp" />
		<%
			} else {
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
				<li><a href="links.jsp">Reguli</a></li>
				<li><a href="declarations.jsp">Declaratii</a></li>
				<li class="active"><a href="settings.jsp">Setari</a></li>
				<li><a href="logout.jsp">Iesire</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
	<div class="well">

<form class="form-horizontal" action="setNewPwd.jsp"> 
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Parola veche:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="old" placeholder="Parola veche">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Parola noua:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" name="new" placeholder="Parola noua">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Parola noua din nou:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" name="confnew" placeholder="Parola noua din nou">
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
</div>
</div>
</div>


		<%
   } // else
%>

</body>
<script>
$("#alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#alert").slideUp(500);
});
</script>
</html>