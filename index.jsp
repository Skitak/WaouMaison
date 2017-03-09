<%@ page import="java.sql.*"%>
<%!

Connection co = null;
String err = null;
public Connection getConnectionToBdd(){
	try{
		Class.forName("org.apache.naming.Constants");
		Class.forName("com.mysql.jdbc.Driver");
	}catch (Exception e){}
	String nom = "jdbc:mysql://db671982259.db.1and1.com:3306/db671982259";
	String user = "dbo671982259";
	String pass = "123456789";
	try {
		co = DriverManager.getConnection(nom,user,pass);
	} catch (Exception e){}
	return co;
}
//Functions

public void supprimerAppart(int num){
	PreparedStatement supprimerAppartStatement = null;
	try {
		supprimerAppartStatement = co.prepareStatement("DELETE FROM APPARTEMENTS WHERE id = ?");
		supprimerAppartStatement.setInt(1, num);
		supprimerAppartStatement.executeQuery();
	} catch (Exception e){}
}

public ResultSet showAppart(){
	ResultSet resultSet = null;
	try { 
		Statement statement = co.createStatement();
		resultSet = statement.executeQuery("Select * from APPARTEMENTS");
	} catch (Exception e){err = e.getLocalizedMessage();}
	return resultSet;
}

/*public void connection(String mdp, String login){
	String log = "Select * from utilisateurs where login = " + login ;
	Statement statement = null;
	ResultSet  result =  null;
	try {
		statement = co.createStatement();
		result =  statement.executeQuery(log);
	} catch (Exception e){}
	if (result.getFetchSize() != 0){
		if (result.getString(2).equals(mdp)){
			session.setAttribute("name",result.getString(0));
			session.setAttribute("role",result.getString(3));
		}else
			throw new RunTimeException("Mot de passe incorrect (╯°□°）╯︵ ┻━┻");
			
    }else{
		throw new RunTimeException("ID incorrect (╯°□°）╯︵ ┻━┻");
	}	
}*/
%>

<% if (session.getAttribute("connection") == null)
	session.setAttribute("connection",getConnectionToBdd());
String nom = (String) session.getAttribute("name");
String role =(String) session.getAttribute("role");
ResultSet result = showAppart();
%>
<jsp:include page="header.jsp" />
	<div id="body">
		<%try{ while (result.next()){ %>
			<div class="appart">
			<img src=<%="'images/Appart" + (int) Math.floor(Math.random() * 6) + ".jpg'" %> height="200" width="300">
			<p>	Adresse : 				<%= result.getString(2)%></br>
				Type d'appartement :	<%= result.getString(1)%>
				Montant :				<%= result.getFloat(5)%>€
			</p>
			</div>
		<% }}catch (Exception e){}%>
		
		<% if (err != null){%>
			<p color="red"><%= err %></p>
		<%}%>
	</div>
<jsp:include page="footer.jsp" />


<%--Faire une requète sql de tout les appart' qui sont validées. 
	Afficher des options dépendant de la personne connecté
	Proposer de se déconnecter si on est connecté
	--%>
