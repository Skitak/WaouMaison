<html>
<%@ page errorPage="CalculError.jsp" %>
<%
int valeur1 = Integer.parseInt(request.getParameter("operande1"));
int valeur2 = Integer.parseInt(request.getParameter("operande2"));
String operation = request.getParameter("operation");
int res;
if (operation.equals("plus"))
	res = valeur1 + valeur2;
else if (operation.equals("moins"))
	res = valeur1 - valeur2;
else if (operation.equals("fois"))
	res = valeur1 * valeur2;
else 
	throw new RuntimeException ("Calcul non supporte");
%>
<head>
	<title> Calcul </title>
</head>
<body bgcolor="orange">
	<h1><%= valeur1 + " " + operation + " "+ valeur2 + " = " + res %><h1>
</body>

</html>