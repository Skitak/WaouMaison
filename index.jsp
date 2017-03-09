<%@ page import="java.sql.*"%>
<%!
public Connection getConnection(){
	Class.forName("org.apache.naming.Constants");
	Class.forName("com.mysql.jdbc.Driver");
	String nom = "jdbc:mysql://db671982259.db.1and1.com:3306/db671982259";
	String user = "dbo671982259";
	String pass = "123456789";
	return DriverManager.getConnection(nom,user,pass);
}
//Functions

public void supprimerAppart(int num){
	PreparedStatement supprimerAppartStatement = co.prepareStatement("DELETE FROM APPARTEMENTS WHERE id = ?");
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
	if (result.getFetchSize() != 0){
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
<% if (session.getAttribute("connection") == null)
	session.setAttribute("connection",getConnection());
String nom = (String) session.getAttribute("name");
String role =(String) session.getAttribute("role");
ResultSet result = showAppart();
%>
<jsp:include page="header.jsp" />
	<div id="body">
		<% try {while (result.next())%{>
			<div class="appart">
			<img src=<%="'images/Appart" + (int) Math.floor(Math.random() * 6) + ".jpg'" %> height="200" width="300">
			<p>	Adresse : 				<%= result.getString(2)%></br>
				Type d'appartement :	<%= result.getString(1)%>
				Montant :				<%= result.getFloat(5)%>€
			</p>
			</div>
		<% }}catch(Exception e){}>
	</div>
<jsp:include page="footer.jsp" />


<%--Faire une requète sql de tout les appart' qui sont validées. 
	Afficher des options dépendant de la personne connecté
	Proposer de se déconnecter si on est connecté
	--%>
