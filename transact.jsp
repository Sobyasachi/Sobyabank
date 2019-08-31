<%
  if(!(session.getAttribute("message")==null))
    out.println("<center>"+session.getAttribute("message")+"</center><br>");
  session.removeAttribute("message");
  if(session.getAttribute("cid")==null || !(session.getAttribute("aid")==null)){
  session.invalidate();
  response.sendRedirect("index.jsp");}
%>


<!DOCTYPE html>
<html>
<body><form action="transactiondone.jsp" method="post">
	<center>
		Type Account number here<br>
		&nbsp;&nbsp;&nbsp;&nbsp;TO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="to"><br>
		AMOUNT: <input type="text" name="amount"><br>
		<input type="submit" value="Send Money">
	</center>
</form></body>
</html>