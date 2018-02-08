<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.ssn.worldcup.model.*"%>
<%    
if ((User)session.getAttribute("user") == null) {
%>
<%@include file="loginForm.jsp" %> 
<%
return;
} 
%>