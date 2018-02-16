<%@page import="com.ssn.core.ApplicationFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ssn.worldcup.model.*" %>
<% 
	String userS = request.getParameter("user");
	String pass = request.getParameter("pass");
  
	ApplicationFactory.getInstance().getModel().setSender(userS, pass);
 
%>

<%@include file="index.jsp" %> 