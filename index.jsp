<%
  if(!(session.getAttribute("message")==null))
    out.println("<center>"+session.getAttribute("message")+"</center><br>");
  session.removeAttribute("message");
%>
<%
  session.invalidate();
%>
<html>
  <body>
      <center>
        <%@include file="menu.html"%><br><hr><br><br>
        <h3>CUSTOMER Login</H3>
        <form action="customercheck.jsp" method="post">
        username <input type="text" placeholder="customer user name" name="cid"><br><br>
        password <input type="password" placeholder="********" name="pwd"><br><br>
        <input type="submit" value="login">&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="reset">
    </form>
    </center>
  </body>
</html>