<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.labelStyle{

border-style: none none groove;
border-color:red;

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
<style>
.raise:hover {
  box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
  transform: translateY(-0.25em);
color: red;
 border: 2px solid;
 }
</style>
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


<div class="bodyDiv">

<FORM action="setComment.jsp" method=POST style="position:fixed; top:250px; right:250px; width:400px">
						
						<input required='' name="declaration"  type='text' >
  <label alt="Introduceti declaratia dumneavoastra de presa" placeholder='exp'></label>
						
						<INPUT type=submit value="Salveaza declaratia de presa" >
						</FORM>



</div>



		<%
   } // else
%>

</body>
</html>