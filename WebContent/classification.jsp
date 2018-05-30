<%@page import="com.ssn.core.ApplicationFactory"%>
<%@page import="com.ssn.core.utils.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>

<%
	PreviousWinner previousWinners[] = { new PreviousWinner("dco", 2002), new PreviousWinner("dco", 2004),
			new PreviousWinner("aci", 2006), new PreviousWinner("tmu", 2008), new PreviousWinner("aio", 2010),
			new PreviousWinner("gbo", 2012), new PreviousWinner("sorin", 2014),
			new PreviousWinner("sorin", 2016) };
%>

<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8" />
<meta name="description" content="2014 competition" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/script.js"></script>
<link rel="stylesheet" href="css/bootstrapOverrides.css"/>

<title>Hall Of Fame</title>

<style>
body, html {
    height: 100%;
    margin: 0;
}
.bg {
    /* The image used */
    /*background-image: url("img/background1.jpg");*/

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
    
}

    #ticker_container{margin-top:6px;}
    #newscontent {margin-right: 10px; float: left;}
    #newscontent a {color: #585858;}
    #news {display: none;}
    #controls { float: right; height: 16px;}
    #news {display: none;}
    .news_tricker{width:50%;}
</style>

<script>

	(function(e) {
		e.fn.tickerme = function(t) {
			var n = e.extend({}, e.fn.tickerme.defaults, t);
			return this
					.each(function() {
						function a() {
							e(t).hide();
							e("body").prepend(r).prepend(i);
							var n = '<div id="ticker_container">';
							n += '<div id="newscontent"><div id="news"></div></div>';
							n += '<div id="controls">';
							n += '<a href="#" id="pause_trigger"><svg class="icon icon-pause" viewBox="0 0 32 32"><use xlink:href="#icon-pause"></use></svg></a>';
							n += '<a href="#" id="play_trigger" style="display:none"><svg class="icon icon-play" viewBox="0 0 32 32"><use xlink:href="#icon-play"></use></svg></a>';
							n += '<a href="#" id="prev_trigger"><svg class="icon icon-prev" viewBox="0 0 32 32"><use xlink:href="#icon-prev"></use></svg></a>';
							n += '<a href="#" id="next_trigger"><svg class="icon icon-next" viewBox="0 0 32 32"><use xlink:href="#icon-next"></use></svg></a>';
							n += "</div>";
							n += "</div>";
							e(n).insertAfter(t);
							e(t).children().each(function(t) {
								s[t] = e(this).html()
							});
							f()
						}
						function f() {
							if (o == s.length - 1) {
								o = 0
							} else {
								o++
							}
							if (n.type == "fade") {
								e("#news").fadeOut(
										n.fade_speed,
										function() {
											e("#newscontent").html(
													'<div id="news">' + s[o]
															+ "</div>");
											e("#news").fadeIn(n.fade_speed)
										})
							}
							u = setTimeout(f, n.duration)
						}
						var t = e(this);
						var r = '<svg display="none" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="224" height="32" viewBox="0 0 224 32"><defs><g id="icon-play"><path class="path1" d="M6 4l20 12-20 12z"></path></g><g id="icon-pause"><path class="path1" d="M4 4h10v24h-10zM18 4h10v24h-10z"></path></g><g id="icon-prev"><path class="path1" d="M18 5v10l10-10v22l-10-10v10l-11-11z"></path></g><g id="icon-next"><path class="path1" d="M16 27v-10l-10 10v-22l10 10v-10l11 11z"></path></g></defs></svg>';
						var i = '<style type="text/css">#ticker_container{width:100%}#newscontent{float:left}#news{display:none}#controls{float:right;height:16px}.icon{display:inline-block;width:16px;height:16px;fill:'
								+ n.control_colour
								+ "}.icon:hover{fill:"
								+ n.control_rollover + "}</style>";
						var s = [];
						var o = -1;
						var u;
						a();
						e("a#pause_trigger").click(function() {
							clearTimeout(u);
							e(this).hide();
							e("#play_trigger").show();
							return false
						});
						e("a#play_trigger").click(function() {
							f();
							e(this).hide();
							e("#pause_trigger").show();
							return false
						});
						e("a#prev_trigger").click(
								function() {
									if (o == 0) {
										o = s.length - 1
									} else {
										o--
									}
									e("#newscontent").html(
											'<div id="news" style="display:block">'
													+ s[o] + "</div>");
									if (n.auto_stop)
										e("a#pause_trigger").trigger("click");
									return false
								});
						e("a#next_trigger").click(
								function() {
									if (o == s.length - 1) {
										o = 0
									} else {
										o++
									}
									e("#newscontent").html(
											'<div id="news" style="display:block">'
													+ s[o] + "</div>");
									if (n.auto_stop)
										e("a#pause_trigger").trigger("click");
									return false
								})
					})
		};
		e.fn.tickerme.defaults = {
			fade_speed : 500,
			duration : 5000,
			auto_stop : true,
			type : "fade",
			control_colour : "#333333",
			control_rollover : "#666666"
		}
	})(jQuery)
</script>
</head>
<body>

<div class="bg">
	<img class="img-responsive" src="img/header.png" alt="Chania"
		width="1920" />
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SSI World Cup Competition</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="classification.jsp">Clasament</a></li>
				<li><a href="forecasts.jsp">Pronosticuri</a></li>
				<li><a href="champions.jsp">Echipa bonus</a></li>
				<li><a href="links.jsp">Reguli</a></li>
				<li><a href="declarations.jsp">Declaratii</a></li>
				<li><a href="settings.jsp">Setari</a></li>
				<li><a href="logout.jsp">Iesire</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">

                <div class="news_tricker">
                <ul id="ticker">
                    <li>Bine ati venit la a 8-a editie a concursului de pronosticuri SSI Schaefer.</li>
                    <li>Pentru consultarea regulamentului va invitam <A href="links.jsp">aici</A></li>
                    
                    <% 
                    for (User u : ApplicationFactory.getInstance().getModel().getUsers()) {  
                      if (u.getComment() != null) {
                    %>
                    <li><B><%= u.getUser() %></B>: <%= u.getComment() %></li>
                    <%
                      }
                    }
                    %>
                </ul>


            </div>


		<div id="Tooltip"
			style='DISPLAY: none; background-color: #FFFFdd; font-family: tahoma; font-size: 2pt; text-align: left; WIDTH: 250px; HEIGHT: 200px; border: 1px solid black; overflow: auto;'
			runat='server'></div>

		<%
			User user = (User) (session.getAttribute("user"));

			if (user == null) {
					response.sendRedirect("index.jsp?alertType=E&alert=Ai fost deconectat. Relogineaza-te.");
			} else {
		%>

		<table class="table table-bordered table-striped table-hover" onmouseout="tooltip.hide();return;hideDiv();">
		    <thead>
      <tr>
        <th>Locul</th>
        <th>Nume</th>
        <th title="Numarul de scoruri corecte ghicite">Scoruri</th>
        <th title="Numarul de meciuri la care a indicat corect echipa castigatoare">Castigatori</th>
        <th title="Reprezinta cate scoruri au fost pronosticate corect din numarul total de meciuri la care castigatoarea a fost pronosticata corect">Noroc</th>
        <th title="Numarul punctelor 'normale'">Puncte</th>
        <th title="Numarul punctelor bonus">Puncte bonus</th>
        <th title="Echipa favorita aleasa">Favorita</th>
        <th title="Numarul punctelor bonus pentru echipa favorita">Bonus favorita</th>
        <th title="Numarul total de puncte (puncte+puncte bonus)">Total</th>
      </tr>
    </thead>
						<tbody>
						<%
							int counter = 0;
								List<Classification> vec = ApplicationFactory.getInstance().getModel().getClassification();
                int previousPosition = 0;
								for (Classification c : vec) {
									counter++;
						%>
						<TR <%= (c.getName().equals(user.getUser()) ?  "class=\"success\"" : "") %>>
            <%
            int currentPos = 1 + c.getHowManyAreBiggerIn(vec);
            
            %>
							<td><%= currentPos != previousPosition ? currentPos : "=" %>
              
              <%
              previousPosition = currentPos;
              if (c.getLastPosition() != 0) {
              if (currentPos > c.getLastPosition()) {
                out.write("<IMG src=\"img/delta_min.gif\" title=\""+c.getLastPosition()+"\"/>");
              } else if (currentPos < c.getLastPosition()) {
                out.write("<IMG src=\"img/delta_plus.gif\" title=\""+c.getLastPosition()+"\"/>");                
              }
              }
              %>
              
              </td>
							<td><B><A title="Vezi pronosticurile lui <%=c.getName()%>" href="forecasts4User.jsp?user=<%=c.getName()%>"> <%=c.getName()%></A> <%
 	String specialCrowns = "";
 			ArrayList<Integer> result = PreviousWinner.count(previousWinners, c.getName());
 			for (Integer year : result) {
 				specialCrowns += " <img src=\"img/smallStar.png\" title=\"Campion in " + year + "\"/> ";
 			}

 			if (counter == 1) {
 				specialCrowns += " <img src=\"img/cup.png\" title=\"Lider virtual\"/> ";
 			}
 %> <%=specialCrowns%>
							</B> <%
							User theUser = ApplicationFactory.getInstance().getModel().getUserByName(c.getName());
							if (theUser.getComment() != null && !theUser.getComment().isEmpty()) {
								%> <img src="img/comment-icon.png"
								title="<%=Utils.escapeHTML(theUser.getComment())%>" /> <%
							}
							%></td>
							<td>

								<%=c.getScores()%></td>

							<td>
								<%=c.getWinners()%>
							</td>


							<td><%=c.getScores() + c.getWinners() > 0
							? 100 * c.getScores() / (c.getWinners()) : 0%>%</td>

							<td>
								<%=c.getWinners() + c.getScores() * 2%>
							</td>

							<td>
								<%=c.getScoreBonus()%>
							</td>

							<td><%=c.getBonusTeam() != null ? c.getBonusTeam() : "--"%></td>
							<td><%=c.getTeamBonus().toString()%></td>
							<td><%=c.getTeamBonus().intValue() + c.getScoreBonus() + c.getWinners() + c.getScores() * 2%></td>

						</TR>

						<%
							}
							}
						%>
</tbody>
					</table>
		</table>
	</div>
	</div>
</body>
<script>
jQuery(function(){
    jQuery('#ticker').tickerme();
  });
  </script>
</html>
