<footer> 
<p> Site réalisé par Bastien Bouquin et Thomas Garand </p>
<%@ page import="java.util.Date" %>
<%
	Date today = new Date();
%> 
<p> <%= today.toString() %> </p>

</footer>
</body>
</html>