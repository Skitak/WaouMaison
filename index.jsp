<%@ page import="java.sql.*"%>
<%@ page errorPage="Error.jsp" %>
<%!

Connection co = null;
String err = null;
public Connection getConnectionToBdd(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch (Exception e){throw new RuntimeException(e.getMessage());}
	String nom = "jdbc:mysql://vs-wamp:3306/dut2_bouquin?";
	String user = "bouquin";
	String pass = "";
	try {
		co = DriverManager.getConnection(nom + "user=" + user + "&password=" + pass);
	} catch (Exception e){ throw new RuntimeException(e.getMessage() + " first"); }
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
	Statement statement = null;
	if (co == null)
		throw new RuntimeException("Connection empty");
	try { 
		 statement = co.createStatement();
		
	} catch (Exception e){throw new RuntimeException(e.getMessage() + " Statement creation");}
	
	try {
		resultSet = statement.executeQuery("Select * from APPARTEMENTS");
	} catch (Exception e){
		throw new RuntimeException(e.getMessage() + " Querry");
	}
	return resultSet;
}


%>

<% if (session.getAttribute("connection") == null)
	session.setAttribute("connection",getConnectionToBdd());
co = (Connection) session.getAttribute("connection");
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
