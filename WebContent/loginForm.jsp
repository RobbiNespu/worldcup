<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.ssn.core.utils.*"%>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%
	String relLF = Utils.getParentsFromServletPath(request.getServletPath());
%>
<div class="clearfix">
	<div class="addBox1">
		<strong>Login</strong> Userrr: <br> Password: <br>
	</div>
	<div class="addBox1">
		<strong> &nbsp</strong>
		<FORM action="<%=relLF%>login.jsp" method="POST">
			<INPUT type="text" name="user" /><BR /> 
			
					<input required='' name="user"  type='text' >
  <label alt="User" placeholder='User'></label>
			
			<input required='' name="password"  type='password' >
  <label alt="Password" placeholder='Password'></label>

			
			
			<br> <br> <INPUT type="submit" value="Login" />
		</FORM>
	</div>
</div>