<%
	if(session.getAttribute("aid")==null)
	response.sendRedirect("adminlogin.jsp");
	else{
%>
<%@include file="connect.jsp"%>
	<!DOCTYPE html>
	<html>
	<head>
		<title>User Service</title>
	</head>
	<body>
		<center>
			<a href="aloggedin.jsp">ADMIN Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Logout</a>|&nbsp;&nbsp;&nbsp;&nbsp;<a href="depositandwithdraw.jsp">Banking Service</a><hr><br>
			<form action="dandw.jsp" method="post">
				To <select name=cid required>
		         <option></option>
		        <%
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
						</select><br>
				Amount        :<input type="text" name="amt" required><br>
				<input type="submit" name="submit" value="withdraw"><input type="submit" name="submit" value="deposit"><br>
			</form>
		</center>
	</body>
	</html>
<%
	}
%>