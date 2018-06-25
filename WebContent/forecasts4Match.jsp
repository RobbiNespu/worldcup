<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="com.ssn.core.*"%>
<%@ page import="com.ssn.core.utils.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
    <%
      User user = (User) (session.getAttribute("user"));
    
      if (user == null) {
        response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
    %>
    <%
      } else {
      user = ApplicationFactory.getInstance().getModel().getUserByName(user.getUser());
      Tournament tour = ApplicationFactory.getInstance().getModel().getActiveTournament();

      DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.ENGLISH);

        List<Match> vec = ApplicationFactory.getInstance().getModel().getMatchesForActiveTournament();
        int mid = Integer.parseInt(request.getParameter("mid"));
        Match m = vec.get(mid);
        
        if (!m.isStillOpenForBets()) {
        List<Forecast> forecasts = m.getForecasts();
        %>
        <table>
        <%
        for (Forecast f : forecasts) {
          %>
          <tr>
          <td><%= f.getUser().getUser() %></td>
          <td><%= f.getScore() %></td>
          </tr>
          <%
        }
        %>
        </table>
        <%
        }
      }
        %>