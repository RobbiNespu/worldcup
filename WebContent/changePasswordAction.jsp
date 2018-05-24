<%@ page import="com.ssn.core.*, com.ssn.worldcup.model.*, com.ssn.core.utils.*"%>
<%@ page import="org.apache.logging.log4j.*"%> 

<html>
<body>
  <%
    //Database.getInstance().log(request.getRemoteAddr()+" createUser.jsp");
    final Logger logger = LogManager.getLogger(Model.class);

    try {
      String vc = request.getParameter("vc");
      String password = request.getParameter("password");

      User tempUser = ApplicationFactory.getInstance().getModel().getUserByValidationCode(vc);

      if (tempUser != null) {
        ApplicationFactory.getInstance().getModel().changePassword(tempUser.getUser(), password);
        response.sendRedirect("index.jsp?alertType=S&alert=Noua parola a fost setata.");
      } else {
        response.sendRedirect("index.jsp?alertType=E&alert=Cod invalid.");
      }
    } catch (Exception ex) {
      out.write(ex.getMessage());
      response.sendRedirect("index.jsp?alert=Error: " + ex.getMessage() + "&alertType=E");
    }
  %>

</body>
</html>