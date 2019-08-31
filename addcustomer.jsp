<%
  if(session.getAttribute("aid")==null)
    response.sendRedirect("index.jsp");
%>
<html>
  <body bgcolor="aqua">
    <center>
      <a href="aloggedin.jsp">ADMIN Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Logout</a>
      <br>
      <h1>ADD CUSTOMER<H1><br>
      <h3>All Fields are required</h3><br>
        <form action="addedcustomer.jsp"  method=post>
        <table>
          <tr>
            <td>Customer Name</td>
            <td><input type=text name=cname required></td>
          </tr>

          <tr>
            <td>Sex</td>
            <td>
            <input type=radio name=sex value=male required>Male
             <input type=radio name=sex value=female>Female
             </td>
          </tr>
          <tr>
            <td>DOB</td>
            <td><input type=date  name=dob></td>
          </tr>
          <tr>
            <td>Balance</td>
            <td><input type=text name=bal value="300" readonly></td>
          </tr>
          <tr>
            <td>Address</td>
            <td><textarea name=adr rows=4 cols=22 required></textarea></td>
          </tr>
          <tr>
            <td>PH NO</td>
            <td><input type=text name=phno required></td>
          </tr>
          <tr>
            <td>Password</td>
            <td><input type=password  placeholder="********" name=pwd required></td>
          </tr>
          </table>
          <input type=submit value=Add>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type=reset  value=reset>

        </form>
      </center>
    </body>
  </html>
