<%@page import="com.ssn.worldcup.utils.JsonDataHolder"%>
<%@page import="java.io.FileWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ssn.core.ApplicationFactory"%>
<%@page import="com.ssn.core.utils.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fasterxml.jackson.core.*"%>


						<%
            
							int counter = 0;
								List<Classification> vec = ApplicationFactory.getInstance().getModel().getClassification();

                Gson gson = new Gson();
                JsonDataHolder holder = new JsonDataHolder();
                holder.setData(vec);
                out.write(gson.toJson(holder));
						%>
