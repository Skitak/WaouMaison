<%@ page import="java.sql.*"%>
<!
Class.forName("com.mysql.jdbc.Driver");
String nom = "jdbc:mysql://db671982259.db.1and1.com:3306/db671982259";
String user = "dbo671982259";
String pass = "123456789";
Connection co = DriverManager.getConnection(nom,user,pass);

PreparedStatement supprimerAppartStatement = co.prepareStatement("DELETE FROM APPARTEMENTS WHERE id = ?");
//Functions

public void supprimerAppart(int num){
	supprimerAppartStatement.setInt(1, num);
	supprimerAppartStatement.executeQuery();
}

public ResultSet showAppart(){
	Statement statement = co.createStatement();
	return statement.executeQuery("Select * from APPARTEMENTS");
}

public void connection(String mdp, String login){
	String log = "Select * from utilisateurs where login = " + login ;
	statement statement = co.createStatement();
	ResulSet  result =  statement.executeQuery(log);
	if (result.getFetchSize() != 0){}
		if (result.getString(2).equals(mdp)){
			session.setAttribute("name",result.getString(0));
			session.setAttribute("role",result.getString(3));
		}else
			throw new RunTimeException("Mot de passe incorrect (╯°□°）╯︵ ┻━┻");
			
    }else{
		throw new RunTimeException("ID incorrect (╯°□°）╯︵ ┻━┻");
	}	
		
		
	
}

%>
<% %>
<jsp:include page="header.jsp" />
	<div id="body">
		<div class="appart">
		<img src="images/Appart1.jpg" height="200" width="300">
		<p>	Adresse : 				15 rue des beautés</br>
			Type d'appartement :	HLM
			Montant :				1 200 000€
		</p>
		</div>
		<div class="appart">
		<img src="images/Appart2.jpg" height="200" width="300">
		<p>	Adresse : 				11 avenue de la porte de Vanves</br>
			Type d'appartement :	HLM
			Montant :				950 000 €
		</p>
		</div>
	</div>
<jsp:include page="footer.jsp" />


<%--Faire une requète sql de tout les appart' qui sont validées. 
	Afficher des options dépendant de la personne connecté
	Proposer de se déconnecter si on est connecté
	--%>