 <%@ page import = "wmdb.*" %>
<%@page import="java.util.*"%>
<html>
<body>
<center>

<%@ page import = "java.sql.*" %>
<% 
Database.getInstance().log(request.getRemoteAddr()+" setChampions.jsp");
	String id = request.getParameter("id");
	String yyyy = request.getParameter("yyyy");
	String MM = request.getParameter("MM");
	String dd = request.getParameter("dd");
	String hh = request.getParameter("hh");
	String mm = request.getParameter("mm");
	String ss = request.getParameter("ss");

	Match m = Database.getInstance().getMatch(id);
	int year = Integer.parseInt(yyyy);
	int month = Integer.parseInt(MM);
	int day = Integer.parseInt(dd);
	int hour = Integer.parseInt(hh);
	int min = Integer.parseInt(mm);
	int sec = Integer.parseInt(ss);
	Calendar cal = new GregorianCalendar();
	cal.set (year, month, day, hour, min, sec);
	m.date = cal.getTime();
%>
</center>
</body>
</html>