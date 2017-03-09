<%@ page import="java.sql.*"%>
<!
Class.forName("com.mysql.jdbc.Driver");
String nom = "jdbc:mysql://db671982259.db.1and1.com:3306/db671982259";
String user = "dbo671982259";
String pass = "123456789";
Connection co = DriverManager.getConnection(nom,user,pass);

PreparedStatement suprimerAppartStatement = co.prepareStatement 
("DELETE FROM APPARTEMENTS WHERE id = ?");
//Functions

public void supprimerAppart(int num){
	suprimerAppartStatement.setInt(1, num);
}

public ResultSet showAppart(){
	return null;
}

%>
<% %>
<jsp:include page="header.jsp" />
	<div id="body">
		<div class="appart">
		<img src="images/Appart1.jpg" height="200" width="300">
		<p>	Adresse : 				15 rue des beautés</br>
			Type d'appartement :	HLM
			Montant :				12 000,00€
		</p>
		</div>
		<div class="appart">
		<img src="images/Appart1.jpg" height="200" width="300">
		<p>	Adresse : 				15 rue des beautés</br>
			Type d'appartement :	HLM
			Montant :				12 000,00€
		</p>
		</div>
	</div>
<jsp:include page="footer.jsp" />


<%--Faire une requète sql de tout les appart' qui sont validées. 
	Afficher des options dépendant de la personne connecté
	Proposer de se déconnecter si on est connecté
	--%>