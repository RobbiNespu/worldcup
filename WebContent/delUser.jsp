<%@ page import = "wmdb.*" %>
<html>
<body>
<center>

<% 
  Database.getInstance().log(request.getRemoteAddr()+" delUser.jsp");
  String id = (String)(request.getParameter("id"));
  System.out.println("Remove: >" + id + "<; "+request.getRemoteAddr());
	if (request.getRemoteAddr().equals("172.28.154.80")) 
	  {
	  	Database.getInstance().users.remove(id);
	  }
%>
</center>
</body>
</html>