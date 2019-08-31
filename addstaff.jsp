<html>
  <body background="bg.JPG">
    <center>
      <br>
      <h1>ADD STAFF<H1><br>
        <form action="addedstaff.jsp"  method=post>
        <table>

          <tr>
            <td>Staff id</td>
            <td><input type=text name=sid></td>
          </tr>
          <tr>
            <td>Staff Name</td>
            <td><input type=text name=sname></td>
          </tr>
          <tr>
            <td>Sex</td>
            <td>
            <input type=radio name=sex value=male>Male
             <input type=radio name=sex value=female>Female
             </td>
          </tr>
          <tr>
            <td>Joining Date</td>
            <td><input type=date  name=doj></td>
          </tr>

            <td>Address</td>
            <td><textarea name=adr rows=4 cols=22></textarea></td>
          </tr>
          <tr>
            <td>PH NO</td>
            <td><input type=text name=phno></td>
          </tr>
          <tr>
            <td>Password</td>
            <td><input type=password  placeholder="********" name=pwd></td>
          </tr>
          </table>
          <input type=submit value=Add>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type=reset  value=reset>

        </form>
      </center>
    </body>
  </html>
