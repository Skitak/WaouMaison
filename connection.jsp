 <%@ page import="java.util.Date" %>
<% %>
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
			<legend>connection:</legend>
				<div class="champ"><p>Login:<br></p><input type="text" name="Login"></div>
				<div class="champ"><p>Password:<br></p><input type="password" name="Password"></div>
				<input type="submit" value="Envoyer">
			</fieldset>
		</form>		
 	</div>
<jsp:include page="footer.jsp" />
