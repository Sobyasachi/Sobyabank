<%
  if(!(session.getAttribute("message")==null))
    out.println("<center>"+session.getAttribute("message")+"</center><br>");
  session.removeAttribute("message");
%>
<%
  if(session.getAttribute("cid")==null){
  session.invalidate();
  response.sendRedirect("index.jsp");}
  else{
%>
<%@include file="connect.jsp" %>

<%@page import="java.text.*" %>
<html>
<body>
<center>
  <a href="cloggedin.jsp">Customer Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
<%
  if(session.getAttribute("aid")==null){
%>
  <a href="index.jsp">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="transact.jsp">Transfer Money</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="bankstatement.jsp">Bank Statement</a><hr><br>
<%
  }
  else{
%>
  <a href="logoutascustomer.jsp">Logout as customer</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
  ADMIN cannot transact for user&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="bankstatement.jsp">Bank Statement</a><hr><br>
<%
  }
  out.println("<center><h1>Welcome  "+(String)session.getAttribute("cname")+"<br></h1>");
  out.println("<h3>Your id is "+(String)session.getAttribute("cid")+"</h3>");
  Statement stmt=con.createStatement();
  ResultSet rs=stmt.executeQuery("select * from customer where cid="+session.getAttribute("cid")+" and edit_id=(select max(edit_id) from customer where cid="+session.getAttribute("cid")+")");
  //ResultSet rs=stmt.executeQuery("select * from sql12303120.customer where cid="+session.getAttribute("cid"));
  rs.next();
  DecimalFormat df=new DecimalFormat();
  df.setMinimumFractionDigits(2);
  String sex=rs.getString("sex");
  double bal=rs.getDouble("bal");
  String address=rs.getString("address");
  long phno=rs.getLong("phno");
  int active=rs.getInt("active");
  if(active==0){
  session.setAttribute("message","The account has been cancelled");
  response.sendRedirect(request.getHeader("referer"));}
  out.println("Your Account Balance is "+df.format(bal));
%>
  <br><br><br><br><br><br><br><br><br><br>
  <h3>Edit details</h3>
  <form action=editedcustomer.jsp method="post">
  <table>
    <tr><td>Sex </td><td><input type="text" name="sex" value="<%=sex%>"><br></td></tr>
    <tr><td>Address</td><td> <input type="text" name="address" value="<%=address%>"><br></td></tr>
    <tr><td>Phone Number </td><td><input type="text" name="phno" value="<%=phno%>"><br></td></tr>
<%
  
  if(session.getAttribute("aid")==null)
  {
%>
    <tr><td>Password</td><td><input type="password" name="pwd" required><br></td></tr>
<%
  }
%>
  </table>
  <input type="submit" value="edit">
  </center>
</body>
</html>
<%}con.close();%>