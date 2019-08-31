<%@include file="connect.jsp" %>
<%
  if(session.getAttribute("aid")==null)
    response.sendRedirect("index.jsp");
%>
<html>
  <body bgcolor="aqua">
    <center>
      <a href="aloggedin.jsp">ADMIN Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Logout</a><br><hr><br><br><br>
      <form action=deletedcustomer.jsp method=post>
        To <select name=cid required>
         <option>select</option>
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
        </select>
        <br>
        <br>
        Your Password : <input type="password" name="pwd"><br><br>
        <input type=submit value=Delete>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type=reset  value=reset>

      </form>
    </center>
  </body>
</html>