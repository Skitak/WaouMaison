<%@ page import="java.util.Date" %>
<% %>
<jsp:include page="header.jsp" />
	<div id="body">
		<form method="post" action="" id="inscription">
		<fieldset>
			<legend>Inscription:</legend>
				<div class="champ"><p>Nom:<br></p><input type="text" name="Name"></div>
				<div class="champ"><p>Nom:<br></p><input type="text" name="Login"></div>
				<div class="champ"><p>Nom:<br></p><input type="text" name="Password"></div>
				<input type="submit" value="Envoyer">
			</fieldset>
		</form>
	</div>
<jsp:include page="footer.jsp" />