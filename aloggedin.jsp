<%
  if(!(session.getAttribute("message")==null))
    out.println("<center>"+session.getAttribute("message")+"</center><br>");
  session.removeAttribute("message");
%>
<html>
<body>
<center>
  <a href="aloggedin.jsp">ADMIN Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Logout</a>|&nbsp;&nbsp;&nbsp;&nbsp;<a href="depositandwithdraw.jsp">Banking Service</a><hr><br>

<%
  if(session.getAttribute("aid")==null)
    response.sendRedirect("adminlogin.jsp");
	out.println("<center><h1>Welcome  "+(String)session.getAttribute("aname")+"<br></h1>");
  out.println("<h3>Your id is "+(String)session.getAttribute("aid")+"</h3>");
%>
<a href="index.jsp">
  <br><br><br><br><br><br><br><br><br><br>
  <table border="1">
    <tr>
      <td><h3><u>Staff</u></h3></td>
      <td><h3><u>Customer</h3></td>
    </tr>
    <tr>
      <td><br><a href=addstaff.jsp>Add</a><br><br><a href=editstaff.jsp>Edit</a><br><br><a href=deletestaff.jsp>Delete</a><br></td>
        <td><br><a href=addcustomer.jsp>Add</a><br><br><a href=editcustomer.jsp>Customer Account</a><br><br><a href=deletecustomer.jsp>Delete</a><br></td>
      </tr>
    </table>
  </center>
</body>
</html>
