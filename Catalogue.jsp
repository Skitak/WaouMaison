<html>
<%@ page errorPage="CatalogueError.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%! ArrayList<String> catalogue = new ArrayList<String>();%>
<head>
	<title> Calcul </title>
	<meta charset="UTF-8">
</head>

<%
String retour;
if (request.getParameter("action") != null){
	String action = request.getParameter("action");//consulter ou ajouter
	String produit = request.getParameter("produit");
	
	if (action.equals("consulter")){
		boolean trouve = false;
		for (String s : catalogue){
			if (s.equals(produit))
				trouve = true;
		}
		if (trouve)
			retour = "Le produit " + produit + " existe";
		else
			retour = "Le produit " + produit + " n'est pas enregistré.";
	}
	else if (action.equals("ajouter")){
		catalogue.add(produit);
		retour = "Le produit a bien été ajouté!";
	}
	else 
		throw new RuntimeException ("nope");
}

else{
	if (catalogue.isEmpty()){
		retour = "Pas de produit pour le moment";
	}
	else{
		retour = "<ul>";
		
		retour.concat("<\ul>");
	}
}

%>

<body bgcolor="orange">
	<h1><%= retour %><h1>
</body>

</html>