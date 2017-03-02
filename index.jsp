<html>
<%@ page import="java.util.Date" %>
<%
Date today = new Date();
boolean sexe = (request.getParameter("sexe").equals("h"));
String nom = request.getParameter("nom");
%>
<head>
	<title> Bonjour! </title>
</head>
<body bgcolor="orange">
	<h1>Bonjour <%=  sexe? "Monsieur" : "Madame"%> <%= nom %>, on est le <%= today.toString()%><h1>
</body>

</html>