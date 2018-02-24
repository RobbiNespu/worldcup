<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

input[type="text"] {
  box-sizing: border-box;
  width: 100%;
  height: calc(4em + 1px);
  margin: 0 0 1em;
  padding: 1em;
  border: 1px solid #ccc;
  background: #fff;
  resize: none;
  outline: none;
}

input[type="text"][required]:focus {
  border-color: #00bafa;
}
input[type="text"][required]:focus + label[placeholder]:before {
  color: #00bafa;
}
input[type="text"][required]:focus + label[placeholder]:before,
input[type="text"][required]:valid + label[placeholder]:before {
  transition-duration: .2s;
  transform: translate(0, -1.5em) scale(0.9, 0.9);
}

input[type="text"][required]:invalid + label[placeholder][alt]:before {
  content: attr(alt);
}

input[type="text"][required] + label[placeholder] {
  display: block;
  pointer-events: none;
  line-height: 1em;
  margin-top: calc(-3em - 2px);
  margin-bottom: calc((3em - 1em) + 2px);
}

input[type="text"][required] + label[placeholder]:before {
  content: attr(placeholder);
  display: inline-block;
  margin: 0 calc(1em + 2px);
  padding: 0 2px;
  color: #898989;
  white-space: nowrap;
  transition: 0.3s ease-in-out;
  background-image: linear-gradient(to bottom, #fff, #fff);
  background-size: 100% 5px;
  background-repeat: no-repeat;
  background-position: center;
}

.animated-button {
	border: 2px solid #65b37a;
	color: #FFF;
}

.animated-button:hover {
	content: "";
	position: absolute;
	height: 0%;
	left: 50%;
	top: 50%;
	width: 150%;
	z-index: -1;
	-webkit-transition: all 0.75s ease 0s;
	-moz-transition: all 0.75s ease 0s;
	-o-transition: all 0.75s ease 0s;
	transition: all 0.75s ease 0s;
}

.animated-button:aaaaaaaaaaaaaaaaa{
	position: relative;
	display: block;
	margin: 30px auto 0;
	padding: 14px 15px;
	color: #fff;
	font-size:14px;
	border-radius: 0;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	letter-spacing: .08em;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	transition: all 1s ease;
}


.animated-button:blinkuie {
	opacity: 0;
	background-image: -webkit-linear-gradient( transparent 50%, rgba(101,179,122,0.2) 50%);
	background-image: -moz-linear-gradient(transparent 50%, rgba(101,179,122,0.2) 50%);
	background-size: 10px 10px;
	-moz-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%));
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
}
.animated-button:hover:after {
	height: 600% !important;
	opacity: 1;
	color: #FFF;
}
</style>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description"
	content="European Football Final Tournament 2008 competition" />
<LINK type="text/css" rel="stylesheet" href="wm.css" />
<LINK type="text/css" rel="stylesheet" href="css/style.css" />
<jsp:include page="style.jsp" />
<title>Settings</title>
</head>
<body onunload="confirmUnsavedChanges()">
		<%
			User user = (User) (session.getAttribute("user"));

			if (user == null) {
				out.write("<SPAN class=SIMPLE_TEXT_ERROR>You are not logged in. Please log in.</SPAN>");
		%>
		<jsp:include page="index.jsp" />
		<%
			} else {
		%>
		<jsp:include page="menuHeader.jsp">
			<jsp:param name="menu" value="4" />
		</jsp:include>


<form action="setComment.jsp" method=POST>
  <input required='' type='text'style="width:250px;">
  <label alt='*exemplu*' placeholder='Introduceti declaratia dumneavoastra de presa' ></label>
  				
						<INPUT type=submit class="animated-button" value="Salveaza declaratia de presa">
</form>





		<table width=70% class="centerAlign" height="600px">
			<tr valign=top>
				<td width=100%><%@ page import="java.sql.*"%>

					<SPAN class=SIMPLE_TEXT><B>Introduceti declaratia
							dumneavoastra de presa</B></SPAN>
					<FORM action="setComment.jsp" method=POST>
						<INPUT name="declaration" size="80" class=ROWINP> <INPUT
							type=submit value="Salveaza declaratia de presa">
					</FORM> <BR /> <SPAN class=SIMPLE_TEXT><B>Schimba parola</B></SPAN>
					<FORM action="setNewPwd.jsp" method=POST>
						<TABLE>
							<TR>
								<td><SPAN class=SIMPLE_TEXT>Parola veche: </SPAN></td>
								<td><INPUT name="old" size="15" class=ROWINP type=password /></td>
							</tr>
							<tr>
								<td><SPAN class=SIMPLE_TEXT>Parola noua: </SPAN></td>
								<td><INPUT name="new" size="15" class=ROWINP type=password /></td>
							</tr>
							<tr>
								<td><SPAN class=SIMPLE_TEXT>Confirma noua parola: </SPAN></td>
								<td><INPUT name="confnew" size="15" class=ROWINP
									type=password /></td>
							</TR>
						</TABLE>
						<INPUT type=submit value="Schimba parola " />
					</FORM></td>
<td>

</td>
			</tr>
		</table>


		<%
   } // else
%>
.centered
  .group
    input(type="text" id="name" required)
    label(for="name") Name
    .bar
</body>
</html>