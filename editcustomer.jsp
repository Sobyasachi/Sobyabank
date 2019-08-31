<%@include file="connect.jsp" %>
<%
	if(!(session.getAttribute("message")==null))
		out.println("<center>"+session.getAttribute("message")+"</center><br>");
	session.removeAttribute("message");
%>
<form action=customercheck.jsp method=post>
<center>
	<a href="aloggedin.jsp">ADMIN Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Logout</a>|&nbsp;&nbsp;&nbsp;&nbsp;<a href="depositandwithdraw.jsp">Banking Service</a><hr><br>
To <select name=cid required>
 <option></option>
<%
	if(session.getAttribute("aid")==null)
    response.sendRedirect("adminlogin.jsp");
	try{
	Statement stmt=con.createStatement();
	String q1="select cid from sql12303120.customer where edit_id in(select max(edit_id) from customer group by cid) and active=1";
	ResultSet rs=stmt.executeQuery(q1);
	while(rs.next())
	{
	  String cid=rs.getString(1);
%>
<option value=<%=cid%>><%=cid%></option>
<%
	}
	con.close();
	}
	catch(Exception e){}
%>
</select>
<br><br><br><br><br><br>
<input type=submit value="Login in as customer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type=reset value="Reset">
</form>
