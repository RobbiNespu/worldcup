<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=utf-8"/>
    <META HTTP-EQUIV="Refresh" CONTENT="300">
        <meta name="description" content="European Football Final Tournament 2012 competition" />
    
	<LINK type="text/css" rel="stylesheet" href="wm.css"/>
  <LINK type="text/css" rel="stylesheet" href="css/style.css"/>
  <script type="text/javascript" language="javascript" src="js/script.js"></script>
	<title>Hall Of Fame</title>
	
	<script language="javascript">

   function ShowDiv(e, text)
   {
  
     // Get the click location
     var height = e.clientY + parseInt('5'); //alert("height="+height);
     // Get the height inside the clicked image
     var offsetHeight = parseInt(e.offsetY); //alert("offsetHeight="+offsetHeight);
     height = height - offsetHeight;
   
     // Get the click location(width)
     var width = e.clientX; //alert("width="+width);
     // Get the width inside the clicked image
     var offsetWidth = parseInt(e.offsetX); //alert("offsetWidth="+offsetWidth);
     width = width - offsetWidth;
     
     var div = document.getElementById('Tooltip');
     div.style.position = 'absolute';

     // Set the div top to the height 
     var nr1=0;
     nr1=parseInt(height) + parseInt('5');
     div.style.top = parseInt(height) + parseInt('5'); //alert("nr1="+nr1);

     // Set the div Left to the height 
     var nr2=0;
     nr2= (parseInt(width) + parseInt('50'));
     div.style.left = parseInt(width) + parseInt('50'); //alert("nr2="+nr2);
     
     // Show the div layer
     div.style.display = 'block';

     // Set its Text to your desired text
     div.innerHTML = text;

    var mytable = document.getElementById('detail');
    //alert(mytable.clientHeight);
    if (mytable.clientHeight < 200)
    {
      div.style.height = mytable.clientHeight+1;
    }
    
    //div.scrollTo( div.style.top, div.style.left);
	
   }

var indiv=false;

function hideDiv()
{
  //if (top.indiv)
  {
    var div = document.getElementById('Tooltip');
    div.style.display='none';
  }
}

function showLastDiv()
{
  //if (top.indiv)
  {
    var div = document.getElementById('Tooltip');
    div.style.display='block';
  }
}
  </script>

	
	
</head>
<body>
<div id="Tooltip" style='DISPLAY:none;background-color:#FFFFdd; font-family:tahoma; font-size:2pt; text-align: left; WIDTH:250px;HEIGHT:200px;border:1px solid black;overflow:auto;' runat='server'></div>

<center>
<table cellspacing=0 class=SIMPLE_TEXT_CENTER width=700px >
<tr>
<td colspan=6>
<A><img src="header.PNG"/></a>
</td>
</tr>


<tr valign=top>
<td colspan=6 align=left >
<%@ page import = "wmdb.*" %>
<%@ page import = "java.util.*" %>
   
	<table width="100%" onmouseout="tooltip.hide();return;hideDiv();" >
  <tr>
  <td colspan = "3" nowrap="nowrap">
  <MARQUEE WIDTH=750 HEIGHT=20 align="left" SCROLLAMOUNT="2" SCROLLDELAY="100" DIRECTION="left" style="background-color:yellow; left-padding:5px;" onmouseover="this.stop()" onmouseout="this.start()">
  <DIV style="background-color: yellow">
  <SPAN class=HEADER_STYLE style="color: blue;" align="left">
  [SSI Schaefer Euro 2012 competition] A mai ramas o zi pana la inceperea competitiei. Nu uitati sa va setati echipa favorita pana atunci (vineri, ora 18:45) !!!
  </SPAN>
  </DIV>
  </MARQUEE>
  </td>
  </tr>
  
  <tr valign=top><td width="100%">
   
  <table  border=1 cellspacing=1 class=TBL>

<tr>
	<td class=FHCELL>Pos</td>
	<td class=FHCELL>User</td>
	<td class=FHCELL>Scores</td>
	<td class=FHCELL>Winners</td>
	<td class=FHCELL>S+W</td>
	<td class=FHCELL title="Reprezinta cate scoruri au fost pronosticate corect din numarul total de meciuri la care castigatoarea a fost pronosticata corect.">Luck</td>
	<td class=FHCELL>Points</td>
	<td class=FHCELL>Bonus</td>
	<td class=FHCELL>Favourite</td>
	<td class=FHCELL>Total</td>
</tr>
<%
  int counter = 0;

	Vector<ClsLine> vec = 	Database.getInstance().getCls(false);

		for (int i=0; i<vec.size(); i++)
    { 
			ClsLine c = vec.get(i);
	  	counter++;

  String gameuser = c.name; 
  int points = c.scores*2+c.winners; 
  int points2 = c.scores; 
  int points3 = c.winners; 
		  String team = Database.getInstance().getBonusTeam(c.name);
		  if (team==null) team = "-";
		  int bonus = c.bonus;
		  int total = points+bonus;
		  boolean eliminated = Database.getInstance().isEliminated(Database.getInstance().getBonusTeam(c.name));

		  String tooltip=Database.getInstance().getLastResults(c.name);
		  
		    StringBuffer res = new StringBuffer();
        StringBuffer resS = new StringBuffer();
        StringBuffer resW = new StringBuffer();
		    int count = 0;
		    int counter2 = 0;
        int counter2s = 0;
        int counter2w = 0;
        User u = Database.getInstance().getUsers().get(gameuser);
        //System.out.println("u.email =" + u.email);
		    res.append ( "<TABLE id=detail cellspacing=1 border=0 class=TBL>");
        //res.append("<TR><TD colspan=3 class=FCELL >"+u.name+"[IP: "+u.email+"]</TD></TR>");
        res.append("<TR><TD colspan=4 class=FCELL><B>"+u.name+"</B> <SPAN class=FCELLW > Forma (ultimele 6 meciuri): last6 </SPAN></TD></TR>");
        int last6 = 0;
        int last6s=0;
        int last6w=0;
        
        resW.append(res);
        resS.append(res);
		    for (int ii=0; ii<Database.getInstance().matches.size (); ii++)
		    {
		      Match m = Database.getInstance().matches.get(Database.getInstance().matches.size()-ii-1);
		      if (m!=null &&  m.date.compareTo ( new Date(System.currentTimeMillis ()) ) < 0)
		      {
		        counter2++;
		        Forecast f = Database.getInstance().getForecast ( c.name, ""+m.id );
		        if (f != null)
		        {
			        int balls = Database.getInstance().getBalls ( m.g1, m.g2, f.g1, f.g2 );
              String color="red";
              
              count++;
              
			        if (balls>3) 
      				{
      					color="#8000FF";
                if (count <= 6) last6s++;
      				}
			        if (balls==3) 
      				{
      					color="green";
      					if (count <= 6) last6s++;
      				}
      			  else if (balls==1) 
      				{
      					color="black";
      					if (count <= 6) last6w++;
      				}
      				else if (m.g1==-1) 
      				{
      					color="gray";
      				}

              if (count <= 6) 
                last6+=balls;
              
      			  if (count <=12) 
                res.append("<TR width=500px style=&quot;color:"+color+"&quot; class=ROW"+((counter2%2==1)?"ODD2":"EVEN2")+"><TD  class=FCELL width=20px >"+m.id+".</TD><TD  class=FCELL width=300px >"+m.t1+" - "+m.t2+" "+(m.g1!=-1?m.g1+"-"+m.g2:"")+"</td><td  width=30px class=FCELL>" + f.g1 + "-" + f.g2  + " </td><td  width=10px class=FCELL >  " + (m.g1==-1?"...":balls+"p")+"</td></tr>");
              
              if (balls >= 3) 
              {
                counter2s++;
                resS.append("<TR width=500px style=&quot;color:"+color+"&quot; class=ROW"+((counter2s%2==1)?"ODD2":"EVEN2")+"><TD  class=FCELL width=20px >"+m.id+".</TD><TD  class=FCELL width=300px >"+m.t1+" - "+m.t2+" "+(m.g1!=-1?m.g1+"-"+m.g2:"")+"</td><td  width=30px class=FCELL>" + f.g1 + "-" + f.g2  + " </td><td  width=10px class=FCELL >  " + (m.g1==-1?"...":balls+"p")+"</td></tr>");
              }
              if (balls == 1){ 
                counter2w++;
                resW.append("<TR width=500px style=&quot;color:"+color+"&quot; class=ROW"+((counter2w%2==1)?"ODD2":"EVEN2")+"><TD  class=FCELL width=20px >"+m.id+".</TD><TD  class=FCELL width=300px >"+m.t1+" - "+m.t2+" "+(m.g1!=-1?m.g1+"-"+m.g2:"")+"</td><td  width=30px class=FCELL>" + f.g1 + "-" + f.g2  + " </td><td  width=10px class=FCELL >  " + (m.g1==-1?"...":balls+"p")+"</td></tr>");
              }
		        }
		        else
		        {
							count++;
							if (count <=12) 
              {
							  res.append("<TR style=&quot;color:#777777&quot; class=ROW"+((counter2%2==1)?"ODD2":"EVEN2")+"><TD  class=FCELL width=20px >"+m.id+".</TD><TD  class=FCELL width=300px >"+m.t1+" - "+m.t2+"</td><td  width=20px class=FCELL>");
							  res.append ( " - " + "</td><td  class=FCELL> 0p</td></tr>");
							}
		        }		        
		      }
		    }

		    res.append("</TABLE>"); 
        resW.append("</TABLE>"); 
        resS.append("</TABLE>"); 
		    String tooltipHTML =  res.toString();
        tooltipHTML = tooltipHTML.replaceFirst("last6", "<B>" + last6 + "p</B> ("+last6s+ " - " + last6w + " - " + (6-last6s-last6w) + ")");
		    
        out.write("<tr titlex=\""+tooltip+"\" class=ROW"+((counter%2==1)?"ODD":"EVEN")+" onmouseover=\"tooltip.show('"+tooltipHTML+"', 300);return;ShowDiv(event,'"+tooltipHTML+"')\" >");

			if (i>0)
			{
				ClsLine c2 = vec.get(i-1);
				if (c2.scores*2+c2.winners+c2.bonus != total || 
					(c2.scores*2+c2.winners+c2.bonus == total && c2.scores != c.scores) ||
					(c2.scores*2+c2.winners+c2.bonus == total && c2.scores == c.scores && c2.bonus != c.bonus) 
					)
				{
				  out.write("<td class=FCELL>"+counter+"</td>");
				}
				else
				{
				  out.write("<td class=FCELL>"+"="+"</td>");
				}
			}
			else
			{
			  out.write("<td class=FCELL>"+counter+"</td>");
			}

      String specialCrowns = "";
      if (u.name.equals("aio") || u.name.equals("tmu") || u.name.equals("aci") || u.name.equals("dco")){
        specialCrowns = " <img src='smallStar.gif'/> ";
      }

			out.write("<td class=FCELL><B>"+(gameuser.length()>9?gameuser.substring(0,9):gameuser)+specialCrowns+"</B></td>");
			out.write("<td class=FCELL onmouseover=\"tooltip.show('"+resS.toString().replaceFirst("last6", "<B>" + last6 + "p</B> ("+last6s+ " - " + last6w + " - " + (6-last6s-last6w) + ")")+"', 300);event.cancelBubble = true;\">"+points2+"</td>");
			out.write("<td class=FCELL onmouseover=\"tooltip.show('"+resW.toString().replaceFirst("last6", "<B>" + last6 + "p</B> ("+last6s+ " - " + last6w + " - " + (6-last6s-last6w) + ")")+"', 300);event.cancelBubble = true;\">"+(points3-points2)+"</td>");
			out.write("<td class=FCELL><I>"+(points3)+"</I></td>");
			out.write("<td class=FCELL><I>"+(points3!=0?""+
			((float)
			 ((int)
			   ((float)(10000*(points2)/(points3))
			 )/100
			 )+"%"):
			"-")+"</I></td>");
		out.write("<td class=FCELL><B>"+points+"</B></td>");
		if (team.equals("-"))
		{
		      String s = "<SPAN class=FCELL>Nu si-a ales favorita la timp.</SPAN>";
			out.write("<td class=FCELL>" + bonus + "</td><td class=FCELL onmouseover=\"tooltip.show('"+s+"', 300);event.cancelBubble = true;\"><SPAN style='color:#888888;'> " + "<strike>"+team+"</strike>" + " </SPAN></td>");
		}
		else if (!eliminated)
		{
      String s = "<SPAN class=FCELL>Puncte bonus pentru " + Database.getInstance().getBonusTeam(c.name) + " : " + "<B>"+Database.getInstance().getTeam(Database.getInstance().getBonusTeam(c.name)).bonusPoints+"</B></SPAN>";
			out.write("<td class=FCELL>" + bonus + "</td>"+
      "<td class=FCELL onmouseover=\"tooltip.show('"+s+"', 300);event.cancelBubble = true;\"> " + team+ "</td>");
		}
		else 
		{
      			String s = "<SPAN class=FCELL>Puncte bonus pentru " + Database.getInstance().getBonusTeam(c.name) + " : " + "<B>"+Database.getInstance().getTeam(Database.getInstance().getBonusTeam(c.name)).bonusPoints+"</B></SPAN>";
			out.write("<td class=FCELL>" + bonus + "</td><td class=FCELL onmouseover=\"tooltip.show('"+s+"', 300);event.cancelBubble = true;\"><SPAN style='color:#888888;'> " + "<strike>"+team+"</strike>" + " </SPAN></td>");
		}
		out.write("<td class=FCELL><B>"+total+"</B></td>");
		out.write("</tr>");
	}

	out.write("</table>");
%>


	</td>
	<td align="left" valign="top" width="200px">
    <DIV id="DIV1" class=MECIUL_URMATOR style="align:left;width:200px;height:50px;border:solid gray 1px;background-color:#CCCCCC">
    <SPAN style="width:200px;align:center">Meciurile urmatoare
  <%
  Vector<Match> matches = Database.getInstance().matches;
  int c=0;
  for (int i=0; i<matches.size(); i++){
    Match m = matches.get(i);
    if (m.g1 == -1){
      out.write("<BR/><SPAN class=MECIUL_URMATOR_DATE >"+ m.date.toString().substring(4,16) + "</SPAN> " + m.t1 + " - " + m.t2);
      c++;
      if (c==2){
        break;
      }
    }else{
    }
  }
  %>
    </SPAN>
    </DIV>
	  <jsp:include page="comments.jsp"/>
  </td>
	</tr>
	</table>

	</td>
</tr>
</table>
</center>
</body>
</html>