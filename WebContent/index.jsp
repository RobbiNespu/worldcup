<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.core.*"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description" content="" />
<title><%=ApplicationFactory.getInstance().getModel().getActiveTournament().toString()%></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

body, html {
    height: 100%;
    margin: 0;
}
.bg {
    /* The image used */
    background-image: url("img/background1.jpg");

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

</style>

</head>
<body onload="document.all['user'].focus()" >

<div class="bg">
<img class="img-responsive" src="img/header.png" alt="Chania" width="1920"/> 
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">SSI World Cup Competition</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li><a href="#" id="myBtn"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
	</nav>
	</div>
	
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;" method="post">
          <form role="form" action="login.jsp">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" name="user" placeholder="Enter username">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" name="password" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div>
  
  <script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>
</body>
</html>

