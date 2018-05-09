<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page import="com.ssn.core.*"%>

<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<link rel="stylesheet" href="button.css">
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
@font-face {
    font-family: roboto_bold;
    src: url(../fonts/roboto_bold.ttf);
    font-weight: 100;
}
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
    /* Full height */
    height: 100%; 
    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-color: #e6e8ed;
}

#corners {
    border-radius: 25px;
    background-color:#efeff7;
   
    background-repeat: repeat;
    padding-top: 7px; 
    padding-left:20px;
    width: 700px;
    height: 300px; 
    margin-top:70px;
    margin-left:150px;
}

.txt_h1 {
 display:block;
 font-size:40px;
 color:#000000;
 line-height:1.2;
 font-family:Nexa Regular,arial,helvetica,sans-serif;
 text-shadow: 3px 2px #d9dbe0;
}


.p{
	font-family:Nexa Regular,arial,helvetica,sans-serif;
	font-size:20px;
	font-family: "Times New Roman", Times, serif;
}
input[type=text] {
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}


</style>

</head>
<body onload="document.all['user'].focus()" class="bg" >

<div >

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

if (ApplicationFactory.getInstance().getModel().getMail() == null) {
  response.sendRedirect("mailsetForm.jsp");
  return;
}
%>

<img class="img-responsive" src="img/header.png" alt="Chania" width="1920"/> 
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">SSI World Cup Competition</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" id="openSignUp"><span class="glyphicon glyphicon-user"></span>
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
        <div class="modal-header" style="padding:35px 50px;background-color:rgba(173, 0, 0);">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="background-color:rgba(173, 0, 0);"><span class="glyphicon glyphicon-lock" style="background-color:rgba(173, 0, 0);"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;" method="post">
          <form role="form" action="login.jsp">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" name="user" placeholder="Enter username">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="password" placeholder="Enter password">
            </div>
            <button type="submit" class="btn btn-success btn-block" style="background-color:rgba(173, 0, 0);"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#" id="signup2" data-dismiss="modal">Sign Up</a></p>
          <p><a href="#" id="forgot" data-dismiss="modal">Forgot password?</a></p>
        </div>
      </div>
  
  </div>
      </div>
  
  
  <div class="modal fade" id="signUpModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;background-color:rgba(173, 0, 0);">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="background-color:rgba(173, 0, 0);"><span class="glyphicon glyphicon-lock" style="background-color:rgba(173, 0, 0);"></span> Sign Up</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="createUser.jsp">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" name="userSI" placeholder="Enter username">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="passwordSI" placeholder="Enter password">
            </div>
                <div class="form-group">
              <label for="psw2"><span class="glyphicon glyphicon-eye-open"></span> Repeat Password</label>
              <input type="password" class="form-control" name="repeatPassword" placeholder="Enter password">
            </div>
             <div class="form-group">
              <label for="mail">E-mail</label>
              <input type="text" class="form-control" name="email" placeholder="Enter e-mail">
            </div>

              <button type="submit" class="btn btn-success btn-block" style="background-color:rgba(173, 0, 0);"><span class="glyphicon glyphicon-off"></span> Sign up</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already a member? <a href="#" data-dismiss="modal" id="login2">Log in</a></p>
        </div>
      </div>
  
      
    </div>
  </div>
  
  <div id="corners">
  <h2 class="txt_h1">Forgot your password?</h2>
  <p>
  To reset your password, please enter your email below. Password reset instructions will be sent to the email address associated with your account. 
  </p>
  <form action="sendChangePasswordLink.jsp">
    <input type="text" name="email" placeholder="E-mail...">
    <button class="user-button" type="submit">
			<span>Submit</span>
		</button>
   </form>
  </div>
  
  <script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });    
    $("#login2").click(function(){
        $("#myModal").modal();
    });    
    $("#openSignUp").click(function(){
        $("#signUpModal").modal();
    });
    $("#signup2").click(function(){
        $("#signUpModal").modal();
    });
});

</script>
</body>

<script>
$("#alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#alert").slideUp(500);
});

$(function () {
	  $('[data-toggle="tooltip"]').tooltip({
	        template: '<div class="tooltip" role="tooltip"><div class="arrow"></div><div class="tooltip-inner" style="max-width:100%"></div></div>'
	    })
});
</script>

</html>

