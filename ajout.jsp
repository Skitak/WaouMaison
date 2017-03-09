<%@ page import="java.util.Date" %>
<% %>
<jsp:include page="header.jsp" />
	<div id="body">
		<form method="post" action="" id="inscription">
		<fieldset>
			<legend>Inscription:</legend>
				<div class="champ"><p>Type d'appartement:<br></p><input type="text" name="Name"></div>
				<div class="champ"><p>Adresse:<br></p><input type="text" name="Login"></div>
				<div class="champ"><p>Montant:<br></p><input type="number" name="Password"></div>
				<input type="submit" value="Envoyer">
			</fieldset>
		</form>
	</div>
<jsp:include page="footer.jsp" />

<%-- Ajouter l'appart à la BDD
	 Lancer un timer
	 Supprimer l'appart à la fin du timer s'il n'est pas vérifié
	 --%>

<!--
TypeAppart VARCHAR2(6),
	Adresse VARCHAR2(75), 
	MontantVente NUMBER (10,2),
	DatePublication Date,
	DateValidation Date,
	AgentValidateur VARCHAR2(20),
	LoginProp VARCHAR2(20), -->