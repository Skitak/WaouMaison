<%! import="java.sql.*";
Class.forName("com.mysql.jdbc.Driver");
String nom = "jdbc:mysql://db671982259.db.1and1.com:3306/db671982259";
String user = "dbo671982259";
String pass = "123456789";
Connection co = DriverManager.getConnection(nom,user,pass);
 %>
 <%-- Connection conn = DriverManager.getConnection(url,user,password); --%>
<% %>
<jsp:include page="header.jsp" />
	<div id="body">
		<h1>Bonjour <h1>
	</div>
<jsp:include page="footer.jsp" />