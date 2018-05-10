<%@ page import="com.ssn.core.*, com.ssn.worldcup.model.*, com.ssn.core.utils.*"%>
<html>
<body>
  <%
    //Database.getInstance().log(request.getRemoteAddr()+" createUser.jsp");
  
    try {
      String email = request.getParameter("email");

      User tempUser = ApplicationFactory.getInstance().getModel().getUserByNameOrEmail("", email);

      if (tempUser != null) {
        String SERVER_AND_PORT = getServletContext().getInitParameter("serverAddress");
        
        String message = 
        "Salut!" + System.lineSeparator() + System.lineSeparator() + //
        "Serios, cum ai reusit sa-ti uiti parola?! Da click pe linkul de mai jos sa ti-o schimbi. :(" + System.lineSeparator() + System.lineSeparator() + //
        "http://" + SERVER_AND_PORT + "/worldcup/changePassword.jsp?vc=" + tempUser.getValidationCode().trim() + System.lineSeparator() + System.lineSeparator() +// 
        "Succes!";

        try {
          ApplicationFactory.getInstance().getModel().getMail().sendMessage(tempUser, message);
        } catch (Throwable ex) {
          throw new RuntimeException("Could not send validation email");
        }

        response.sendRedirect("index.jsp?alertType=S&alert=Verifica-ti email-ul pentru a-ti schimba parola.");
    } else {
         response.sendRedirect("index.jsp?alertType=E&alert=Adresa de mail nu exista.");
    }
    } catch (Exception ex) {
      out.write(ex.getMessage());
      response.sendRedirect("index.jsp?alert=Error: "+ex.getMessage()+"&alertType=E");
    }
  %>

</body>
</html>