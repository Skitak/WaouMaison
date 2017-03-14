 <%@ page import="java.util.Date" %>
<% 

public void connection(String mdp, String login){
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
}

%>
<jsp:include page="header.jsp" />
	<div id="body">
	<!-- <form action ="">
		<fieldset>
			<label> Utilisateur  </label>
			<input type="text" id="txtUser" />
			<br></br>
			<label> Mot de passe </label>
			<input type="text" id="txtPw" />
			<br></br>
			<button type="button" id="btnOk" onclick = " ">
			Ok
			</button>
		</fieldset>
	</form> -->
	<form method="post" action="" id="inscription">
		<fieldset>
			<legend id="connection">connection:</legend>
				<div class="champ"><p>Login:<br></p><input type="text" name="Login"></div>
				<div class="champ"><p>Password:<br></p><input type="password" name="Password"></div>
				<input type="submit" value="Envoyer">
			</fieldset>
		</form>		
 	</div>
<jsp:include page="footer.jsp" />
